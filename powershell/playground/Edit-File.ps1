Function Edit-File
{
    <#
        .SYNOPSIS
        .DESCRIPTION
        .PARAMETER FileSpec
        .EXAMPLE
        .NOTES
        .LINK
    #>
    
    Param
        (
            $FileSpec
        )

    Begin
        {
        }

    Process
        {
        }

    End
        {
        }
}

$FilesToOpen = Get-ChildItem $FileSpec
Foreach ($file in $FilesToOpen)
{
&notepad++ $File.FullName
}