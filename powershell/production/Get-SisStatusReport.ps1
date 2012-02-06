<#
    .SYNOPSIS
        Get SIS Status
    .DESCRIPTION
        This script uses Get-SisReport to get the status of SiS'd disks on a storage server.
    .PARAMETER Disks
        Requires a disk object, if left blank gets all disks where the Provider
        is filesystem.
    .EXAMPLE
    .NOTES
        ScriptName: Get-SisStatusReport.ps1
        Created By: Jeff Patton
        Date Coded: July 8, 2011
        ScriptName is used to register events for this script
        LogName is used to determine which classic log to write to
    .LINK
#>
Param
    (
    $Disks = (Get-PSDrive)
    )
Begin
    {
        $ScriptName = $MyInvocation.MyCommand.ToString()
        $LogName = "Application"
        $ScriptPath = $MyInvocation.MyCommand.Path
        $Username = $env:USERDOMAIN + "\" + $env:USERNAME

        New-EventLog -Source $ScriptName -LogName $LogName -ErrorAction SilentlyContinue

        $Message = "Script: " + $ScriptPath + "`nScript User: " + $Username + "`nStarted: " + (Get-Date).toString()
        Write-EventLog -LogName $LogName -Source $ScriptName -EventID "100" -EntryType "Information" -Message $Message 

        #	Dotsource in the functions you need.
        . .\includes\ComputerManagement.ps1
        $DiskReport = @()
    }
Process
    {
        foreach ($Disk in $Disks |Sort-Object -Property Name)
        {
            if ($Disk.Provider.Name -eq "FileSystem")
            {
                $Report = Get-SiSReport -SiSDisk $Disk.Name
                $LineItem = New-Object -TypeName PSObject @{
                    "Disk" = $Report.Disk
                    "Used (GB)" = $Report.Used
                    "Free (GB)" = $Report.Free
                    "Common Store Files" = $Report.CommoneStoreFiles
                    "Link Files" = $Report.LinkFiles
                    "Inaccessible Link Files" = $Report.InaccessibleLinkFiles
                    "Space Saved (GB)" = $Report.SpaceSaved
                    }
                }
                $DiskReport += $LineItem
            }
    }
End
    {
        $Message = "Script: " + $ScriptPath + "`nScript User: " + $Username + "`nFinished: " + (Get-Date).toString()
        Write-EventLog -LogName $LogName -Source $ScriptName -EventID "100" -EntryType "Information" -Message $Message
        Return $DiskReport
    }