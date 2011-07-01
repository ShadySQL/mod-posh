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

Function New-RepoRevision
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