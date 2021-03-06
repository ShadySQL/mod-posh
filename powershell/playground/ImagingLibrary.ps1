Function Get-ImagesFromWDS
{
    <#
        .SYNOPSIS
            Return images from Windows Desktop Search
        .DESCRIPTION
        .PARAMETER FileProps
        .PARAMETER PhotoProps
        .PARAMETER LocalPath
        .PARAMETER FileExtension
        .EXAMPLE
        .NOTES
        .LINK
        .INPUTS
            strin objects
        .OUTPUTS
            database objects
    #>
    
    Param
    (
    $FileProps = "System.FileName, System.ItemPathDisplay",
    $PhotoProps = "System.Photo.CameraManufacturer, System.Photo.CameraModel, System.Photo.DateTaken, System.Photo.Flash, System.Photo.FNumber, System.Photo.FocalLength, System.Photo.ISOSpeed, System.Photo.Orientation, System.Photo.ShutterSpeed, System.Photo.SubjectDistance",
    $LocalPath  = "$($env:SystemDrive)$($env:HomePath)\Pictures",
    $FileExtension = ".jpg"
    )
    
    Begin
    {
        $IndexProvider = "Provider=Search.CollatorDSO;Extended Properties='Application=Windows';"
        #$SQL=("SELECT $($FileProps), $($PhotoProps) FROM SYSTEMINDEX WHERE System.FileExtension='$($FileExtension)' AND SCOPE='file:$($localpath.Replace("\","/"))'")
        $SQL=("SELECT $($FileProps), $($PhotoProps) FROM SYSTEMINDEX WHERE System.Kind='Picture' AND SCOPE='file:$($localpath.Replace("\","/"))'")
        }
    
    Process
    {
        $Adapter = New-Object System.Data.oleDB.oleDBDataadapter -argumentlist $sql, $IndexProvider
        $ds = New-Object System.data.dataset
        $Adapter.Fill($ds) |Out-Null
        }
    End
    {
        Return $ds
        }
}

Function Get-BitmapHash
{
    <#
        .SYNOPSIS
        .DESCRIPTION
        .PARAMETER FileName
        .EXAMPLE
        .NOTES
        .LINK
    #>
    
    Param 
    (
    [string] $FileName
    )
    
    Begin
    {
        $result = ""
        $cryptoServiceProvider = [System.Security.Cryptography.MD5CryptoServiceProvider];
        $hashAlgorithm = new-object $cryptoServiceProvider
            [System.Drawing.Bitmap] $Bitmap = New-Object System.Drawing.Bitmap($FileName)
            [System.IO.MemoryStream] $MemStream = New-Object System.IO.MemoryStream
        }

    Process
    {
        $Bitmap.Save($MemStream, [System.Drawing.Imaging.ImageFormat]::Bmp)
        $hashByteArray = $hashAlgorithm.ComputeHash($MemStream);    
        foreach ($byte in $hashByteArray) 
        { 
            $result += “{0:X2}” -f $byte 
            }
        $Bitmap.Dispose()
        }

    End
    {
        return $result
        }
}

Function Get-CoordsFromUint64
{
    <#
        .SYNOPSIS
            Converts a Rational number to a decimal
        .DESCRIPTION
            Converts a Rational number to a decimal
        .PARAM Number
            A rational number
        .EXAMPLE
            $longitude = $metadata.GetQuery("/app1/ifd/gps/subifd:{ulong=2}")
            Get-CoordsFromUint64 $Longitude[2]
            13
            
            Description
            -----------
            This example pulls an array of uInt64's from the gps data on an image
            and returns a decimal that represents the seconds in a degreees:minutes:seconds
            coordinate system.
        .NOTES
            This code was pulled from the first comment on this blog post
            http://dedjo.blogspot.com/2007/04/how-to-read-gps-metadata-from-image.html
        .LINK
    #>
    Param
    (
        [long]$Number
    )

    Begin
    {
        $bytes = [BitConverter]::GetBytes($Number)
        }

    Process
    {
        [int]$int1 = [BitConverter]::ToInt32($bytes,0)
        [int]$int2 = [BitConverter]::ToInt32($bytes,4)
        }

    End
    {
        Return ([double]$int1 / [double]$int2)
        }
}

Function Get-GpsCoords
{
    <#
        .SYNOPSIS
            Return GPS co-ordinates from an image
        .DESCRIPTION
            This function opens a file and pulls metadata from inside of it. Specifically
            the GPS tags are queried. The object returned contains GPS co-ordinates that
            can be used to determine the location the image was captured at.
        .PARAMETER FileName
            The full path and filename of the image to evaluated
        .EXAMPLE
            Get-GpsCoords -FileName $Image.FullName
        .NOTES
        .LINK
    #>
    Param
    (
    $FileName
    )
    
    Begin
    {
        [System.Reflection.Assembly]::LoadWithPartialName("PresentationCore") > $null

        $stream = new-object System.IO.FileStream($filename, [System.IO.FileMode]::Open)
        $decoder = new-object System.Windows.Media.Imaging.JpegBitmapDecoder($stream,
            [System.Windows.Media.Imaging.BitmapCreateOptions]::PreservePixelFormat,
            [System.Windows.Media.Imaging.BitmapCacheOption]::None)

        $metadata = $decoder.Frames[0].Metadata
        }
    
    Process
    {
        Try
        {
            $latitude = $metadata.GetQuery("/app1/ifd/gps/subifd:{ulong=2}")
            $longitude = $metadata.GetQuery("/app1/ifd/gps/subifd:{ulong=4}")
            $altitude = $metadata.GetQuery("/app1/ifd/gps/subifd:{ulong=6}")
            
            $GpsCoords = New-Object -TypeName PSObject -Property @{
                laDeg = Get-CoordsFromUint64 -Number $latitude[0]
                laMin = Get-CoordsFromUint64 -Number $latitude[1]
                laSec = Get-CoordsFromUint64 -Number $latitude[2]
                laDir = $metadata.GetQuery("/app1/ifd/gps/subifd:{ulong=1}")
                loDeg = Get-CoordsFromUint64 -Number $longitude[0]
                loMin = Get-CoordsFromUint64 -Number $longitude[1]
                loSec = Get-CoordsFromUint64 -Number $longitude[2]
                loDir = $metadata.GetQuery("/app1/ifd/gps/subifd:{ulong=3}")
                alt = Get-CoordsFromUint64 -Number $altitude
                }
            }
        Catch
        {
            Return $null
            }
        }
    
    End
    {
        Return $GpsCoords
        }
}
Function Search-WindowsDesktop
{
    <#
        .SYNOPSIS
        .DESCRIPTION
        .PARAMETER Fields
        .PARAMETER Filter
        .EXAMPLE
            Search-WindowsDesktop "System.Title", "System.RecordedTV.EpisodeName" "WHERE System.RecordedTV.ChannelNumber IS NOT NULL"
        .EXAMPLE
            Search-WindowsDesktop "System.Contact.FullName" "WHERE System.Contact.FullName IS NOT NULL"
        .EXAMPLE
            Search-WindowsDesktop "System.Photo.CameraModel", "System.Photo.ProgramModeText", "System.Photo.OrientationText" "WHERE System.Photo.DateTaken IS NOT NULL"
        .NOTES
            FunctionName : Search-WindowsDesktop
            Created by   : jspatton
            Date Coded   : 06/12/2012 14:47:28
        .LINK
            https://code.google.com/p/mod-posh/wiki/Untitled3#Search-WindowsDesktop
        .LINK
            http://blogs.technet.com/b/industry_insiders/archive/2008/09/15/testing-for-database-null-values-from-powershell.aspx
    #>
    [CmdletBinding()]
    Param
        (
        $Fields,
        $Filter
        )
    Begin
    {
        $connection = New-Object -comObject "ADODB.Connection" 
        $recordSet = New-Object -comObject "ADODB.RecordSet" 
        $connection.ConnectionTimeout=0
        $connection.CommandTimeout=0
        $null = $connection.Open("Provider=Search.CollatorDSO;Extended Properties='Application=Windows';") > $null 

        $ofs = "," 
        $query = "SELECT $fields" 
        $query += " FROM SYSTEMINDEX $filter" 
        $null = $recordSet.Open($query, $connection) 
        }
    Process
    {
        if ($recordSet.EOF) 
        { 
            return 
            } 
        $recordSet.MoveFirst() 

        while (-not $recordSet.EOF) 
        {
            $result = New-Object Object 
            foreach ($field in $fields) 
            {
                $result | Add-Member NoteProperty $field $recordSet.Fields.Item($field).Value
                } 
            $result 
            $recordSet.MoveNext()
            } 
        }
    End
    {
        $null = $recordSet.Close() 
        $null = $connection.Close() 

        $connection = $null 
        $recordSet = $null 
        }
    }