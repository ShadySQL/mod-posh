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
	
	. .\includes\ActiveDirectoryManagement.ps1
    . .\includes\ComputerManagement.ps1

    $Workstations = Get-ADObjects -ADSPath $ADSPath
    $Jobs = @()
	foreach ($Workstation in $Workstations)
        {
            [string]$ThisWorkstation = $Workstation.Properties.name
            $AdminAcct = Get-LocalUserAccounts -ComputerName $ThisWorkstation
            $ThisJob = New-Object PSobject

            Add-Member -InputObject $ThisJob -MemberType NoteProperty -Name "ComputerName" -Value $ThisWorkstation
            
            foreach ($Acct in $AdminAcct)
                {
                    switch ($Acct.name)
                        {
                            ops
                                {
                                    $Retval = Set-Pass -ComputerName $ThisWorkstation -UserName $Acct.name -Password $NewPassword
                                    Add-Member -InputObject $ThisJob -MemberType NoteProperty -Name "UserName" -Value $Acct.name
                                    }
                            Administrator
                                {
                                    $Retval = Set-Pass -ComputerName $ThisWorkstation -UserName $Acct.name -Password $NewPassword
                                    Add-Member -InputObject $ThisJob -MemberType NoteProperty -Name "UserName" -Value $Acct.name
                                    }
                        }
                }
            
            Add-Member -InputObject $ThisJob -MemberType NoteProperty -Name "Status" -Value $RetVal.Trim()
            $Jobs += $ThisJob
            $ThisJob
            }
            	
	$Message = "Script: " + $ScriptPath + "`nScript User: " + $Username + "`nFinished: " + (Get-Date).toString()
	Write-EventLog -LogName $LogName -Source $ScriptName -EventID "100" -EntryType "Information" -Message $Message	