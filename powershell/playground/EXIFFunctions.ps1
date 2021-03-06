function MakeNumber 
{
    $First =$args[0].value[0] + 256 * $args[0].value[1] + 65536 * $args[0].value[2] + 16777216 * $args[0].value[3] ;
    $Second=$args[0].value[4] + 256 * $args[0].value[5] + 65536 * $args[0].value[6] + 16777216 * $args[0].value[7] ;

    if ($first -gt 2147483648) 
    {
        $first = $first  - 4294967296
        } ;
    if ($Second -gt 2147483648) 
    {
        $Second= $Second - 4294967296
        } ;
    if ($Second -eq 0) 
    {
        $Second= 1
        } ;

    if (($first –eq 1) -and ($Second -ne 1)) 
    {
        write-output ("1/" + $Second)
        }
    else 
    {
        write-output ($first / $second)
        }
}

function MakeString 
{
    $s="" ; 
    for ($i=0 ; $i -le $args[0].value.length; $i ++) 
    {
        $s = $s+ [char]$args[0].value[$i] 
        }; 
    Write-Output $s
}

Function Get-BitmapHash
{
    param (
    [string] $FileName
    )
    $result = ""
    $cryptoServiceProvider = [System.Security.Cryptography.MD5CryptoServiceProvider];
    $hashAlgorithm = new-object $cryptoServiceProvider
        [System.Drawing.Bitmap] $Bitmap = New-Object System.Drawing.Bitmap($FileName)
        [System.IO.MemoryStream] $MemStream = New-Object System.IO.MemoryStream


        $Bitmap.Save($MemStream, [System.Drawing.Imaging.ImageFormat]::Bmp)
        $hashByteArray = $hashAlgorithm.ComputeHash($MemStream);    
        foreach ($byte in $hashByteArray) 
        { 
            $result += “{0:X2}” -f $byte 
            }
        $Bitmap.Dispose()

    return $result
}