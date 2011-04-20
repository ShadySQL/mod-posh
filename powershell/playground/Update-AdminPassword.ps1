<#
    .SYNOPSIS
        Local administrator password update
    .DESCRIPTION
        This script changes the local administrator password.
    .PARAMETER ADSPath
        The ActiveDirectory namespace to search for computers
    .PARAMETER AdminAccount
        The username of the administrator account
    .PARAMETER Password
        The new password
    .EXAMPLE
    .NOTES
        ScriptName is used to register events for this script
        LogName is used to determine which classic log to write to
    .LINK
#>

    $ScriptName = $MyInvocation.MyCommand.ToString()
    $LogName = "Application"
    $ScriptPath = $MyInvocation.MyCommand.Path
    $Username = $env:USERDOMAIN + "\" + $env:USERNAME

	New-EventLog -Source $ScriptName -LogName $LogName -ErrorAction SilentlyContinue
	
	$Message = "Script: " + $ScriptPath + "`nScript User: " + $Username + "`nStarted: " + (Get-Date).toString()
	Write-EventLog -LogName $LogName -Source $ScriptName -EventID "100" -EntryType "Information" -Message $Message 
	
	
	
	$Message = "Script: " + $ScriptPath + "`nScript User: " + $Username + "`nFinished: " + (Get-Date).toString()
	Write-EventLog -LogName $LogName -Source $ScriptName -EventID "100" -EntryType "Information" -Message $Message	