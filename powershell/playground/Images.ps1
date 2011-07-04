#
# Working on setting up a photo repo, I need to be able to run through each image and yank the pertinent 
# information from it. Most of this is stored as EXIF data on digital cameras and can be pulled out with
# powershell. I found several websites along the way, most gave me the actual code needed but not all.
#
# http://blogs.technet.com/b/jamesone/archive/2007/07/13/exploring-photographic-exif-data-using-powershell-of-course.aspx
# This posting has the functions I dot source into the beginning
#
# http://stevesmithblog.s3.amazonaws.com/OrgPhotos.ps1
# This posting had a clean code sample to view, most seemed to be chopped or included random emoticons :(
#
# http://www.exif.org/Exif2-2.PDF
# The actual spec, contains the table of all properties availble.
#
# GPS data
# String Property 1: N or E
# Number Property 2: Latitude
# String Property 3: S or W
# Number Property 4: Longitude

. .\EXIFFunctions.ps1

[reflection.assembly]::loadfile( "C:\Windows\Microsoft.NET\Framework\v2.0.50727\System.Drawing.dll")
$photos = Get-ChildItem -Path "C:\Users\Jeff Patton\Pictures\From SAMSUNG SGH-i917 (2)\" -Recurse -Filter *.jpg
$VbCrLf = "`r`n"
foreach ($photo in $photos)
{
    $image = New-Object -TypeName system.drawing.bitmap -ArgumentList $photo.FullName
    $FileName = "C:\temp\"+($photo.name).replace(".","_")+".txt"
    New-Item -Path $FileName -ItemType File
    $Content = $null
    foreach ($Property in $image.PropertyItems)
    {
        if ($Property.Type -eq 2)
            {
                $Value = MakeString $image.GetPropertyItem($Property.Id)
                $Content += "String Property $($Property.Id): $($Value)" + $VbCrLf
                } 
        else 
            {
                $Value = MakeNumber $image.GetPropertyItem($Property.Id)
                $Content += "Number Property $($Property.Id): $($Value)" + $VbCrLf
                }
            }
    Set-Content -Path $FileName -Value $Content
    }