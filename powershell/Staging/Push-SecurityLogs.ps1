<#
    .SYNOPSIS
        A script that will copy archived security logs into a zip file, and purge
        zip'd files older than a set number of days.
    .DESCRIPTION
        The idea behind this script was to be more pro-active with our logging on 
        domain controllers. We have modified the auditing policies of our servers to
        give us more pertinent information. In addition we have configured the servers
        to automatically create an archive of the security log when it gets full.

        We don't need to maintain these logs forever so we needed a facility that 
        would allow us to easily purge logs older than a certain point in time. That's
        what this script allows us to do.

        This script functions in two different ways. I wanted a single script that I 
        could run from a schedulded task and just change the parameters I passed in
        to modify it's behaviour.

        The first method of using this script is with the Copy parameter. In this mode
        the script will get a list of archived log files from the directory provided
        in the LogPath parameter. It will then create a zip file with the name of the server
        and the date when this script ran. If you pass the Purge parameter into the script
        it will also remove those individual archived logs.

        The second method of using this script is with the Archive parameter. In this
        mode the script will get a list of zip'd archives from the directory provided in
        the ArchivePath parameter, and check the age against the RetentionDays parameter.
        If the file is older than RetentionDays the file is deleted.
    .PARAMETER Copy
        This parameter, if present puts the script into "copy mode." It will copy the archived
        log files from the LogPath location, into a zipfile in the ArchivePath location.
    .PARAMETER Archive
        This parameter, if present puts the script into "archive mode." It will get a list
        of zipfiles from the ArchivePath and see if they are older than the RetentionDays.
        If so, it will delete the file.
    .PARAMETER Purge
        This parameter, if present tells the script to delete the archived file.
    .PARAMETER LogPath
        This is the location where the Windows Event Logs are stored. The default Windows
        location is the default value for this parameter.
    .PARAMETER LogPrefix
        This is the prefix of the log you wish to copy. The format appears to be "Archive-
        LogName." So, for the Security log it is "Archive-Security" which is what the 
        default value of this parameter is.
    .PARAMETER ArchivePath
        This is the location where the zipfiles should be stored, the default location is
        c:\temp
    .PARAMETER RetentionDays
        The number of days to retain the zip'd archived log files, the default value is 90
    .EXAMPLE
        .\Push-SecurityLogs.ps1 -Copy -Purge

        Description
        -----------
        This example will create a zipfile in the default location, of all the archived
        logs found.
    .EXAMPLE
        .\Push-SecurityLogs.ps1 -Archive

        Description
        -----------
        This example will remove the archive files that are older than 90 days.
    .NOTES
        ScriptName : Push-SecurityLogs.ps1
        Created By : jspatton
        Date Coded : 11/06/2012 13:13:13
        ScriptName is used to register events for this script
 
        ErrorCodes
            100 = Success
            101 = Error
            102 = Warning
            104 = Information

        I use 7-zip in order to create the compressed file, I tried several methods for
        doing this without any additional tools, but the accepted method thus far for 
        powershell requires that an interface be present otherwise it won't work. Since 
        this script is running from a scheduled task, that's not actually possible.

        In my case I have downloaded the 64-bit version of 7-zip and copied the following
        two files to a directory called c:\scripts. 
            7z.exe
            7z.dll
    .LINK
        https://code.google.com/p/mod-posh/wiki/Production/Push-SecurityLogs.ps1
    .LINK
        http://www.7-zip.org/download.html
#>
[CmdletBinding()]
Param
   (
    [switch]$Copy,
    [switch]$Archive,
    [switch]$Purge,
    [string]$LogPath = 'C:\Windows\System32\winevt\Logs',
    [string]$LogPrefix = 'Archive-Security',
    [string]$ArchivePath = 'C:\Temp',
    [int]$RetentionDays = 90
    )
Begin
    {
        $ScriptName = $MyInvocation.MyCommand.ToString()
        $ScriptPath = $MyInvocation.MyCommand.Path
        $Username = $env:USERDOMAIN + "\" + $env:USERNAME
 
        New-EventLog -Source $ScriptName -LogName 'Windows Powershell' -ErrorAction SilentlyContinue
 
        $Message = "Script: " + $ScriptPath + "`nScript User: " + $Username + "`nStarted: " + (Get-Date).toString()
        Write-EventLog -LogName 'Windows Powershell' -Source $ScriptName -EventID "104" -EntryType "Information" -Message $Message
 
        #	Dotsource in the functions you need.
        }
Process
    {
        if ($Copy)
        {
            [string]$FilePart = (Get-Date -f 'yyyMMdd-HHmmss')
            [string]$HostPart = (& hostname).ToLower()
            [string]$ArchiveFile = "$($HostPart)-$($FilePart).zip"

            try
            {
                $ArchivedLogFiles = Get-ChildItem $LogPath -Filter "$($LogPrefix)*"

                if ($ArchivedLogFiles)
                {
                    $ZipFilename = "$($ArchivePath)\$($ArchiveFile)"

                    if (!(Test-Path $ArchivePath))
                    {
                        New-Item $ArchivePath -ItemType Directory -Force |Out-Null
                        }

                    Invoke-Expression -Command "C:\scripts\7z.exe a $($ZipFilename) $($LogPath)\$($logprefix)*"
                    if ($LASTEXITCODE -ne 0)
                    {
                        $Message = "An error occured, the software returned exit code: $($LASTEXITCODE)"
                        Write-EventLog -LogName 'Windows Powershell' -Source $ScriptName -EventID "101" -EntryType "Error" -Message $Message
                        }
                    if ($Purge)
                    {
                        Remove-Item "$($LogPath)\$($logprefix)*" -Force
                        }
                    }
                else
                {
                    $Message = "No archived logs found"
                    Write-EventLog -LogName 'Windows Powershell' -Source $ScriptName -EventID "104" -EntryType "Warning" -Message $Message
                    }
                }
            catch
            {
                $Message = $Error[0].Exception
                Write-EventLog -LogName 'Windows Powershell' -Source $ScriptName -EventID "101" -EntryType "Error" -Message $Message
                }
            }

        if ($Archive)
        {
            try
            {
                $ZipFiles = Get-ChildItem $ArchivePath

                foreach ($ZipFile in $ZipFiles)
                {
                    [int]$ZipFileAge = ((Get-Date) - $ZipFile.CreationTime).Days
                    if ($ZipFileAge -gt $RetentionDays)
                    {
                        Remove-Item $ZipFile.FullName
                        }
                    }
                }
            catch
            {
                $Message = $Error[0].Exception
                Write-EventLog -LogName 'Windows Powershell' -Source $ScriptName -EventID "101" -EntryType "Error" -Message $Message
                }
            }
        }
End
    {
        $Message = "Script: " + $ScriptPath + "`nScript User: " + $Username + "`nFinished: " + (Get-Date).toString()
        Write-EventLog -LogName 'Windows Powershell' -Source $ScriptName -EventID "104" -EntryType "Information" -Message $Message
        }