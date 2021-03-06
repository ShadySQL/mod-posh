<#
    .SYNOPSIS
        Template script
    .DESCRIPTION
        This script sets up the basic framework that I use for all my scripts.
    .PARAMETER ComputerName
    .PARAMETER Action
    .EXAMPLE
        Get-DefragReport.ps1
    .NOTES
        ScriptName : Get-DefragReport.ps1
        Created By : jspatton
        Date Coded : 11/14/2011 12:30:48
        ScriptName is used to register events for this script
        LogName is used to determine which classic log to write to
 
        ErrorCodes
            100 = Success
            101 = Error
            102 = Warning
            104 = Information
    .LINK
        http://scripts.patton-tech.com/wiki/PowerShell/Production/Get-DefragReport.ps1
    .LINK
        http://msdn.microsoft.com/en-us/library/windows/desktop/aa389832(v=VS.85).aspx
#>
#requires -version 2
[cmdletbinding()]
Param
    (
        [Parameter(Mandatory=$true,ValueFromPipeline=$true)]
        $ComputerName,
        [Parameter(Mandatory=$false)]
        [ValidateSet('Report','Defrag')]
        [string]$Action = 'Report'
    )
Begin
    {
        $ScriptName = $MyInvocation.MyCommand.ToString()
        $LogName = "Application"
        $ScriptPath = $MyInvocation.MyCommand.Path
        $Username = $env:USERDOMAIN + "\" + $env:USERNAME
 
        New-EventLog -Source $ScriptName -LogName $LogName -ErrorAction SilentlyContinue
 
        $Message = "Script: " + $ScriptPath + "`nScript User: " + $Username + "`nStarted: " + (Get-Date).toString()
        Write-EventLog -LogName $LogName -Source $ScriptName -EventID "104" -EntryType "Information" -Message $Message
 
        #	Dotsource in the functions you need.
        $Report = @()
        }
Process
    {
        foreach ($Computer in $ComputerName)
        {
            $Message = $null
            try
            {
                Write-Verbose "Make sure that $($Computer) is online"
                Test-Connection -ComputerName "$($Computer)" -Count 1 -ErrorAction Stop |out-null
                
                Write-Verbose "Get a list of all local disks for $($Computer), where the capacity is larger than 99Mb."
                $Volumes = Get-WmiObject -Class Win32_Volume -Filter 'DriveType=3' -ComputerName "$($Computer)" -ErrorAction Stop `
                    -Credential $Credentials |Where-Object {$_.Capacity -gt 104853504}
                }
            catch
            {
                Write-Verbose "Caught an Exception"
                $Message = $Error[0].Exception.Message
                Write-EventLog -LogName $LogName -Source $ScriptName -EventID "101" -EntryType "Error" -Message $Message
                $Error.Clear()	
                }
            foreach ($Volume in $Volumes)
            {
                Write-Verbose "Check to see if $($Volume.Name) needs defragmented."
                $Dirty = $Volume.DefragAnalysis()
                
                switch ($Action)
                {
                    'Report'
                    {
                        if ($Message -eq $null)
                        {
                            $LineItem = New-Object -TypeName PSObject -Property @{
                                ComputerName = "$($Computer)"
                                Volume = $Volume.Name
                                Capacity = $Volume.Capacity
                                DefragRecommended = $Dirty.DefragRecommended
                                }
                            }
                        else
                        {
                            $LineItem = New-Object -TypeName PSObject -Property @{
                                ComputerName = "$($Computer)"
                                Volume = $Message
                                Capacity = ""
                                DefragRecommended = ""
                                }
                            }
                        }
                    'Defrag'
                    {
                        if ($Dirty.DefragRecommended -eq $true)
                        {
                            Write-Verbose "$($Volume.Name) is being defragmented"
                            $Defrag = $Volume.Defrag($true)
                            }
                        if ($Message -eq $null)
                        {
                            $LineItem = New-Object -TypeName PSObject -Property @{
                                ComputerName = "$($Computer)"
                                Volume = $Volume.Name
                                Capacity = $Volume.Capacity
                                
                                }
                            }
                        else
                        {
                            $LineItem = New-Object -TypeName PSObject -Property @{
                                ComputerName = "$($Computer)"
                                Volume = $Message
                                Capacity = ""
                                }
                            }
                        }
                    }
                }
            $Report += $LineItem
            }
        }
End
    {
        $Message = "Script: " + $ScriptPath + "`nScript User: " + $Username + "`nFinished: " + (Get-Date).toString()
        Write-EventLog -LogName $LogName -Source $ScriptName -EventID "104" -EntryType "Information" -Message $Message	
	$Report
        }