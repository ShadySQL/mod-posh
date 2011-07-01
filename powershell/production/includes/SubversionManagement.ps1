Function Update-Repo
{
    <#
        .SYNOPSIS
            Update your repository
        .DESCRIPTION
            This function will update your working directory to the latest HEAD version of your repo.
        .PARAMETER WorkingPath
            The default is to use the current working directory, but you can specify an alternate
            location on the command-line
        .EXAMPLE
            Update-Repo
            At revision 378.
            True

            Description
            -----------
            This shows the basic usage with the default value for $WorkingPath
        .EXAMPLE
            Update-Repo -WorkingPath'C:\Users\Jeff Patton\My Repositories\scripts'
            At revision 378.
            True

            Description
            -----------
            This shows passing an alternate directory into the function.
        .NOTES
            This function checks to see what the value of $SubversionClient is before executing
            the update.
            Define $SubversionClient in your $profile, the two possible values I check are:
                svn, tortoise
        .LINK
    #>
    
    Param
    (
    [string]$WorkingPath = (Get-Location).Path
    )
    
    Begin
    {
        $TSvnCommand = "TortoiseProc.exe /command:update /path:`"$($WorkingPath)`""
        $SvnCommand = "svn update `"$($WorkingPath)`""
        }

    Process
    {
        Switch ($SubversionClient)
            {
                svn
                    {
                        Invoke-Expression $SvnCommand
                        }
                tortoise
                    {
                        Invoke-Expression $TSvnCommand
                        }
                }
        }

    End
    {
        Return $?
        }
}

Function New-Repo
{
    <#
        .SYNOPSIS
            Create a new repository folder.
        .DESCRIPTION
            This function will checkout the repository specified on the command line to a 
            folder on your hard-drive.
        .PARAMETER RepoURL
            The URL of your subversion repository
        .PARAMETER UserName
            The username that you use to login to your repository
        .PARAMETER WorkingPath
            The default is to use the current working directory, but you can specify an alternate
            location on the command-line
        .PARAMETER TargetFolder
            The folder that will hold your repository
        .EXAMPLE
            New-Repo -RepoUrl https://code.patton-tech.com/repos/scripts -TargetFolder scripts -UserName repoman
            A    C:\repos\scripts\powershell
            A    C:\repos\scripts\powershell\playground
            A    C:\repos\scripts\powershell\playground\ScriptingGames
            A    C:\repos\scripts\powershell\playground\ScriptingGames\2011

            Description
            -----------
            The basic usage of the command.
        .NOTES
            This function checks to see what the value of $SubversionClient is before executing
            the update.
            Define $SubversionClient in your $profile, the two possible values I check are:
                svn, tortoise
        .LINK
    #>
    
    Param
    (
    [string]$RepoUrl,
    [string]$UserName,
    [string]$WorkingPath = (Get-Location).Path,
    [string]$TargetFolder
    )
    
    Begin
    {
        $CheckoutPath = "$($WorkingPath)\$($TargetFolder)"
        $TSvnCommand = "TortoiseProc.exe /command:checkout /path:`"$($CheckoutPath)`" /url:$($RepoURL)"
        $SvnCommand = "svn checkout $($RepoURL) `"$($CheckoutPath)`" --username $($UserName)"
        }

    Process
    {
        Switch ($SubversionClient)
            {
                svn
                    {
                        Invoke-Expression $SvnCommand
                        }
                tortoise
                    {
                        Invoke-Expression $TSvnCommand
                        }
                }
        }

    End
    {
        Return $?
        }
}

Function Add-RepoItem
{
    <#
        .SYNOPSIS
            Add's a file to the repository
        .DESCRIPTION
            This function will add $FileName from the $WorkingPath to the repository.
        .PARAMETER WorkingPath
            The default is to use the current working directory, but you can specify an alternate
        .PARAMETER FileName
            The filename and extension of the file to add to the repository
        .EXAMPLE
            Add-RepoItem .\test.txt
            A         test.txt
            True

            Description
            -----------
            This example shows the basic usage of the command
        .NOTES
            This function checks to see what the value of $SubversionClient is before executing
            the update.
            Define $SubversionClient in your $profile, the two possible values I check are:
                svn, tortoise
        .LINK
    #>
    
    Param
    (
    [string]$WorkingPath = (Get-Location).Path,
    [string]$FileName
    )
    
    Begin
    {
        if ($FileName.StartsWith(".\") -eq $true)
            {
                $FileName = $FileName.Replace(".\","")
                }
        $FilePath = "$($WorkingPath)\$($FileName)"
        $TSvnCommand = "TortoiseProc.exe /command:add /path: `"$($FilePath)`""
        $SvnCommand = "svn add `"$($FilePath)`""
        }

    Process
    {
        Switch ($SubversionClient)
            {
                svn
                    {
                        Invoke-Expression $SvnCommand
                        }
                tortoise
                    {
                        Invoke-Expression $TSvnCommand
                        }
                }
        }

    End
    {
        Return $?
        }
}

Function Remove-RepoItem
{
    <#
        .SYNOPSIS
            Removes a file from the repository
        .DESCRIPTION
            This function will remove $FileName from the $WorkingPath to the repository.
        .PARAMETER WorkingPath
            The default is to use the current working directory, but you can specify an alternate
        .PARAMETER FileName
            The filename and extension of the file to remove from the repository
        .EXAMPLE
            Remove-RepoItem .\test.txt
            D         test.txt
            True

            Description
            -----------
            This example shows the basic usage of the command
        .NOTES
            This function checks to see what the value of $SubversionClient is before executing
            the update.
            Define $SubversionClient in your $profile, the two possible values I check are:
                svn, tortoise
        .LINK
    #>
    
    Param
    (
    [string]$WorkingPath = (Get-Location).Path,
    [string]$FileName
    )
    
    Begin
    {
        if ($FileName.StartsWith(".\") -eq $true)
            {
                $FileName = $FileName.Replace(".\","")
                }
        $FilePath = "$($WorkingPath)\$($FileName)"
        $TSvnCommand = "TortoiseProc.exe /command:remove /path: `"$($FilePath)`""
        $SvnCommand = "svn delete `"$($FilePath)`" --force"
        }

    Process
    {
        Switch ($SubversionClient)
            {
                svn
                    {
                        Invoke-Expression $SvnCommand
                        }
                tortoise
                    {
                        Invoke-Expression $TSvnCommand
                        }
                }
        }

    End
    {
        Return $?
        }
}

Function Set-RepoProps
{
    <#
        .SYNOPSIS
        .DESCRIPTION
        .PARAMETER
        .EXAMPLE
        .NOTES
            This function checks to see what the value of $SubversionClient is before executing
            the update.
            Define $SubversionClient in your $profile, the two possible values I check are:
                svn, tortoise
        .LINK
    #>
    
    Param
    (
    [string]$WorkingPath = (Get-Location).Path,
    [string]$FileName
    )
    
    Begin
    {
        if ($FileName.StartsWith(".\") -eq $true)
            {
                $FileName = $FileName.Replace(".\","")
                }
        $FilePath = "$($WorkingPath)\$($FileName)"
        $TSvnCommand = "TortoiseProc.exe /command:remove /path: `"$($FilePath)`""
        $SvnCommand = "svn delete `"$($FilePath)`" --force"
        }

    Process
    {
        Switch ($SubversionClient)
            {
                svn
                    {
                        Invoke-Expression $SvnCommand
                        }
                tortoise
                    {
                        Invoke-Expression $TSvnCommand
                        }
                }
        }

    End
    {
        Return $?
        }
}

Function Commit-RepoItem
{
    <#
        .SYNOPSIS
        .DESCRIPTION
        .PARAMETER
        .EXAMPLE
        .NOTES
            This function checks to see what the value of $SubversionClient is before executing
            the update.
            Define $SubversionClient in your $profile, the two possible values I check are:
                svn, tortoise
        .LINK
    #>
    
    Param
    (
    )
    
    Begin
    {
        
        }

    Process
    {
        Switch ($SubversionClient)
            {
                svn
                    {
                        Invoke-Expression $SvnCommand
                        }
                tortoise
                    {
                        Invoke-Expression $TSvnCommand
                        }
                }
        }

    End
    {
        Return $?
        }
}