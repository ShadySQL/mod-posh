<#
    .SYNOPSIS
        New-StudentWorker.ps1
    .DESCRIPTION
        This script will copy the group membership from an existing student
        worker to a new student worker.
    .PARAMETER ADSPath
        This is the LDAP URL to where your user accounts are stored
    .PARAMETER NewUser
        The username of the new student worker
    .PARAMETER SearchFilter
        The searchFilter to pass on to AD, I'm using FSPs so it defaults
        to foreignSecurityPrincipal, but it could be Person if you're
        working with user accounts all within the same ActiveDirectory domain.
    .PARAMETER ExistingStudent
        The username of the existing student worker
    .PARAMETER Verbose
        Enable the debugging statements
    .EXAMPLE
        New-StudentWorker -ADSPath -NewUser -ExistingUser
    .NOTES
        ScriptName : New-StudentWorker
        Created By : jspatton
        Date Coded : 09/22/2011 10:17:53
        ScriptName is used to register events for this script
        LogName is used to determine which classic log to write to
 
        ErrorCodes
            100 = Success
            101 = Error
            102 = Warning
            104 = Information
    .LINK
 #>
Param
    (
    [Parameter(Mandatory=$true)]$ADSPath,
    [Parameter(Mandatory=$true)]$NewUser,
    $SearchFilter = '(objectCategory=foreignSecurityPrincipal)',
    $ExistingUser
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
 
        if ($Verbose)
        {
            $DebugPreference = "Continue"
            $VerbosePreference = $DebugPreference
            }
        #	Dotsource in the functions you need.
        . .\includes\ActiveDirectoryManagement.ps1
        
        Write-Verbose "Get a list of all user objects"
        $Users = Get-ADObjects -ADSPath $ADSPath -SearchFilter $SearchFilter
        Write-Verbose "Since I'm dealing with FSPs I need to convert the friendly name to a sid, and then store the object back."
        foreach ($User in $Users)
        {
            $NewUser = $User.Properties.name |Convert-FspToUsername |Where-Object {$_.sAMAccountName -like "*$($NewUser)"}
            $ExistingUser = $User.Properties.name |Convert-FspToUsername |Where-Object {$_.sAMAccountName -like "*$($ExistingUser)"}
            }
        Write-Verbose "Found $($NewUser.sAMAccountName)"
        Write-Verbose "Found $($ExistingUser.sAMAccountName)"
        }
Process
    {
        Write-Verbose "Get the group membership for CN=$($ExistingUser.Sid),$($ADSPath)"
        $StudentGroups = Get-UserGroupMembership -UserDN "CN=$($ExistingUser.Sid),$($ADSPath)"
        foreach ($StudentGroup in $StudentGroups)
        {
            Write-Verbose "Try adding $($NewUser.sAMAccountName) to $StudentGroup.GroupDN"
            Add-UserToGroup -GroupDN $StudentGroup.GroupDN -UserDN "LDAP://CN=$($NewUser.Sid),$($ADSPath)"
            }
        }
End
    {
        $Message = "Script: " + $ScriptPath + "`nScript User: " + $Username + "`nFinished: " + (Get-Date).toString()
        Write-EventLog -LogName $LogName -Source $ScriptName -EventID "104" -EntryType "Information" -Message $Message
        if ($Verbose)
        {
            $DebugPreference = "SilentlyContinue"
            $VerbosePreference = $DebugPreference
            }
        }


