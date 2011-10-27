<#
    .SYNOPSIS
        Return host denied lease
    .DESCRIPTION
        This script works in conjunction with an Event Trigger on the 
        Microsoft-Windows-Dhcp-Server/FilterNotifications log on our 
        DHCP server. This script queries the Microsoft-Windows-Dhcp-Server/FilterNotifications
        log for EventID 20097, and returns the MAC, Hostname, HardwareType, Time and Message
        of the event. 
        
        This should be the same event that triggered this script to
        run in the first place.
        
        It outputs an XML file to the C:\LogFiles directory which exists on
        the server, if not it creates the folder.
    .PARAMETER FileName
        The fully qualified path and filename for the report.
    .EXAMPLE
        Get-DHCPDenies.ps1
        
        Description
        -----------
        This is the only syntax for this script.
    .NOTES
        ScriptName : Get-DHCPDenies.ps1
        Created By : jspatton
        Date Coded : 10/27/2011 09:26:54
        ScriptName is used to register events for this script
        LogName is used to determine which classic log to write to
 
        ErrorCodes
            100 = Success
            101 = Error
            102 = Warning
            104 = Information
    .LINK
        http://scripts.patton-tech.com/wiki/PowerShell/Production/Get-DHCPDenies.ps1
#>
Param
    (
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
    }
Process
    {
        $Event20097 = Get-WinEvent -LogName Microsoft-Windows-Dhcp-Server/FilterNotifications |Where-Object {$_.id -eq 20097}
        if ($Event20097.Count -eq $null)
        {
            $Report = New-Object -TypeName PSObject -Property @{
                MacAddress = $Event20097.Properties[0].Value
                HostName = $Event20097.Properties[1].Value
                HWType = $Event20097.Properties[2].Value
                TimeCreated = $Event20097.TimeCreated
                Message = $Event20097.Message
                }
            $FileName = "DHCPDeny-$($Event20097.Properties[0].Value).xml"
            }
        else
        {
            $Report = New-Object -TypeName PSObject -Property @{
                MacAddress = $Event20097[0].Properties[0].Value
                HostName = $Event20097[0].Properties[1].Value
                HWType = $Event20097[0].Properties[2].Value
                TimeCreated = $Event20097[0].TimeCreated
                Message = $Event20097[0].Message
                }
            $FileName = "DHCPDeny-$($Event20097[0].Properties[0].Value).xml"
            }
    }
End
    {
        $Message = "Script: " + $ScriptPath + "`nScript User: " + $Username + "`nFinished: " + (Get-Date).toString()
        Write-EventLog -LogName $LogName -Source $ScriptName -EventID "100" -EntryType "Information" -Message $Message
        if ((Test-Path -Path C:\LogFiles) -eq $false)
        {
            New-Item C:\LogFiles -ItemType Directory 
            }
        Export-Clixml -Path "C:\StorageReports\$($FileName)" -InputObject $Report
    }