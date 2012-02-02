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
            http://scripts.patton-tech.com/wiki/PowerShell/SubversionManagement#Update-Repo
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
        if ($SubversionClient -eq $null)
        {
            Write-Host "Please assign the variable `$Global:SubversionClient in your `$Profile, to either svn or tortoise."
            write-Host "For example `$Global:SubversionClient=`'svn`' for the win32svn client."
            break
            }

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
            http://scripts.patton-tech.com/wiki/PowerShell/SubversionManagement#New-Repo
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
        if ($SubversionClient -eq $null)
        {
            Write-Host "Please assign the variable `$Global:SubversionClient in your `$Profile, to either svn or tortoise."
            write-Host "For example `$Global:SubversionClient=`'svn`' for the win32svn client."
            break
            }

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
            This function will add $FileName to the repository.
        .PARAMETER FileName
            The filename and extension of the file to add to the repository
        .EXAMPLE
            Add-RepoItem -FileName .\test.txt
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
            http://scripts.patton-tech.com/wiki/PowerShell/SubversionManagement#Add-RepoItem
    #>
    
    Param
    (
    [Parameter(Mandatory=$true)]
    [string]$FileName
    )
    
    Begin
    {
        $FilePath = (Get-ChildItem $FileName).FullName
        $TSvnCommand = "& TortoiseProc.exe /command:add /path: `"$($FilePath)`""
        $SvnCommand = "& svn add `"$($FilePath)`""
        }

    Process
    {
        if ($SubversionClient -eq $null)
        {
            Write-Host "Please assign the variable `$Global:SubversionClient in your `$Profile, to either svn or tortoise."
            write-Host "For example `$Global:SubversionClient=`'svn`' for the win32svn client."
            break
            }

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
            This function will remove $FileName from the repository.
        .PARAMETER FileName
            The filename and extension of the file to remove from the repository
        .EXAMPLE
            Remove-RepoItem -FileName .\test.txt
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
            http://scripts.patton-tech.com/wiki/PowerShell/SubversionManagement#Remove-RepoItem
    #>
    
    Param
    (
    [Parameter(Mandatory=$true)]
    [string]$FileName
    )
    
    Begin
    {
        $FilePath = (Get-ChildItem $FileName).FullName
        $TSvnCommand = "TortoiseProc.exe /command:remove /path: `"$($FilePath)`""
        $SvnCommand = "svn delete `"$($FilePath)`" --force"
        }

    Process
    {
        if ($SubversionClient -eq $null)
        {
            Write-Host "Please assign the variable `$Global:SubversionClient in your `$Profile, to either svn or tortoise."
            write-Host "For example `$Global:SubversionClient=`'svn`' for the win32svn client."
            break
            }

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
            Set properites for an item under revision control.
        .DESCRIPTION
            This function will allow you to set the properties for items under source control. The
            default PropSet sets the mime-type to text/plain.
            
            For a list of examples see: http://svnbook.red-bean.com/en/1.0/re23.html
        .PARAMETER FileName
            The filename and extension of the file to remove from the repository
        .PARAMETER PropSet
            This is the svn property you wish to set on the item under revision control. For example
            to set a file's mime-type to be text you would pass in the following string.
                svn:mime-type 'text/plain'
        .EXAMPLE
            Set-RepoProps -FileName .\template.ps1
            property 'svn:mime-type' set on 'template.ps1'
            True

            Description
            -----------
            This example shows the basic usage of the command.
        .EXAMPLE
            Set-RepoProps -PropSet "owner sally" -FileName .\template.ps1
            property 'owner' set on 'C:\repos\scripts\powershell\production\template.ps1'
            True

            Description
            -----------
            This example shows using the PropSet parameter to define the owner of a file.
        .NOTES
            This function checks to see what the value of $SubversionClient is before executing
            the update.
            Define $SubversionClient in your $profile, the two possible values I check are:
                svn, tortoise
        .LINK
            http://scripts.patton-tech.com/wiki/PowerShell/SubversionManagement#Set-RepoProps
    #>
    
    Param
    (
    [string]$PropSet = "svn:mime-type 'text/plain'",
    [Parameter(Mandatory=$true)]
    [string]$FileName
    )
    
    Begin
    {
        $FilePath = (Get-ChildItem $FileName).FullName
        $TSvnCommand = "TortoiseProc.exe /command:properties /path: `"$($FilePath)`""
        $SvnCommand = "svn propset $($PropSet) `"$($FilePath)`""
        }

    Process
    {
        if ($SubversionClient -eq $null)
        {
            Write-Host "Please assign the variable `$Global:SubversionClient in your `$Profile, to either svn or tortoise."
            write-Host "For example `$Global:SubversionClient=`'svn`' for the win32svn client."
            break
            }

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
            Commit changes to the repository.
        .DESCRIPTION
            This function commits recent changes to items under revision control to the repository.
        .PARAMETER FileName
            The filename and extension of the file to remove from the repository
        .PARAMETER Commitmessage
            This is the log message to pass in with the commit.
        .EXAMPLE
            Commit-RepoItem -FileName .\template.ps1 -CommitMessage "Setting the mime-type to text/plain"
            Sending        template.ps1

            Committed revision 383.
            True

            Description
            -----------
            This example shows the default syntax of the command.
        .NOTES
            This function checks to see what the value of $SubversionClient is before executing
            the update.
            Define $SubversionClient in your $profile, the two possible values I check are:
                svn, tortoise
        .LINK
            http://scripts.patton-tech.com/wiki/PowerShell/SubversionManagement#Commit-RepoItem
    #>
    
    Param
    (
    [Parameter(Mandatory=$true)]
    [string]$FileName,
    [Parameter(Mandatory=$true)]
    [string]$CommitMessage
    )
    
    Begin
    {
        $FilePath = (Get-ChildItem $FileName).FullName
        $TSvnCommand = "& TortoiseProc.exe /command:commit /path: `"$($FilePath)`" /logmsg:`"$($CommitMessage)`""
        $SvnCommand = "& svn commit `"$($FilePath)`" -m `"$($CommitMessage)`""
        }

    Process
    {
        if ($SubversionClient -eq $null)
        {
            Write-Host "Please assign the variable `$Global:SubversionClient in your `$Profile, to either svn or tortoise."
            write-Host "For example `$Global:SubversionClient=`'svn`' for the win32svn client."
            break
            }

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
Function Get-SvnInfo
{
    <#
        .SYNOPSIS
            Get information about the current repo
        .DESCRIPTION
            This function returns an objectified version of the svn info command.
        .PARAMETER WorkingPath
            The default is to use the current working directory, but you can specify an alternate
            location on the command-line
        .EXAMPLE
            Get-SvnInfo

            RepositoryUUID    : eda1a4bd-5e7d-452c-8317-4a2619d6e488
            LastChangedDate   : 2012-01-20 11:32:21 -0600 (Fri, 20 Jan 2012)
            NodeKind          : directory
            LastChangedAuthor : jeffrey
            Revision          : 514
            LastChangedRev    : 514
            URL               : http://code.patton-tech.com/repos/scripts
            Schedule          : normal
            WorkingCopy       : C:\scripts
            RepositoryRoot    : http://code.patton-tech.com/repos/scripts
            Path              : .

            Description
            -----------
            This shows the basic syntax of the command. Here the command was run from within
            the checked out repository.
        .EXAMPLE
            Get-SvnInfo -WorkingPath c:\patton

            RepositoryUUID    : 62335152-db53-1043-89ad-74d48cd9e3ba
            LastChangedDate   : 2012-01-23 17:02:11 -0600 (Mon, 23 Jan 2012)
            NodeKind          : directory
            LastChangedAuthor : jeffrey
            Revision          : 517
            LastChangedRev    : 517
            URL               : file:///C:/old
            Schedule          : normal
            WorkingCopy       : C:\patton
            RepositoryRoot    : file:///C:/old
            Path              : C:\patton

            Description
            -----------
            This shows the command being run from outside the checked out repository.
        .NOTES
            FunctionName : Get-SvnInfo
            Created by   : jspatton
            Date Coded   : 02/02/2012 16:22:28
            
            This function checks to see what the value of $SubversionClient is before executing
            the update.
            Define $SubversionClient in your $profile, the two possible values I check are:
                svn, tortoise
        .LINK
            http://scripts.patton-tech.com/wiki/PowerShell/SubversionManagement#Get-SvnInfo
    #>
    Param
        (
        [string]$WorkingPath = (Get-Location).Path
        )
    Begin
    {
        $TSvnCommand = "TortoiseProc.exe /command:update /path:`"$($WorkingPath)`""
        $SvnCommand = "svn info `"$($WorkingPath)`""

        if ($SubversionClient -eq $null)
        {
            Write-Host "Please assign the variable `$Global:SubversionClient in your `$Profile, to either svn or tortoise."
            write-Host "For example `$Global:SubversionClient=`'svn`' for the win32svn client."
            break
            }

        Switch ($SubversionClient)
            {
                svn
                    {
                        $Info = Invoke-Expression $SvnCommand
                        }
                tortoise
                    {
                        Write-Host "SVN Info command not supported by Tortoisesvn"
                        break
                        }
                }
        }
    Process
    {
        foreach ($Item in $info)
        {
            if ($Item.Length -gt 0)
            {
                $Colon = $Item.IndexOfAny(":")
                $FieldName = ($Item.Substring(0,$Item.IndexOfAny(":"))).Trim()
                $FieldData  = ($Item.Substring($Item.IndexOfAny(":") +2, ($Item.Length)-$Item.IndexOfAny(":") -2)).Trim()
                
                switch ($FieldName)
                {
                    'Path'
                    {
                        $rPath = $FieldData
                        }
                    'Working Copy Root Path'
                    {
                        $WorkingRoot = $FieldData
                        }
                    'URL'
                    {
                        $URL  = $FieldData
                        }
                    'Repository Root'
                    {
                        $RepoRoot = $FieldData
                        }
                    'Repository UUID'
                    {
                        $RepoUUID = $FieldData
                        }
                    'Revision'
                    {
                        $Revision = $FieldData
                        }
                    'Node Kind'
                    {
                        $Node = $FieldData
                        }
                    'Schedule'
                    {
                        $Schedule = $FieldData
                        }
                    'Last Changed Author'
                    {
                        $LastAuthor = $FieldData
                        }
                    'Last Changed Rev'
                    {
                        $LastRev = $FieldData
                        }
                    'Last Changed Date'
                    {
                        $LastChangeDate = $FieldData
                        }
                    }
                }
            }
        }
    End
    {
        New-Object -TypeName PSObject -Property @{
            Path = $rpath
            WorkingCopy = $WorkingRoot
            URL = $URL
            RepositoryRoot = $RepoRoot
            RepositoryUUID = $RepoUUID
            Revision = $Revision
            NodeKind = $Node
            Schedule = $Schedule
            LastChangedAuthor = $LastAuthor
            LastChangedRev = $LastRev
            LastChangedDate = $LastChangeDate
            }
        }
    }