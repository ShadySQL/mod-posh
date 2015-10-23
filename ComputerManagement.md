## New-LocalUser ##
```

NAME
    New-LocalUser
    
SYNOPSIS
    Create a new user account on the local computer.
    
SYNTAX
    New-LocalUser [-ComputerName] <String> [-User] <String> [-Password] <String> [[-Description] <S
    tring>] [<CommonParameters>]
    
    
DESCRIPTION
    This function will create a user account on the local computer.
    

PARAMETERS
    -ComputerName <String>
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -User <String>
        The user name of the account that will be created.
        
        Required?                    true
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -Password <String>
        The password for the account, this must follow password policies enforced
        on the destination computer.
        
        Required?                    true
        Position?                    3
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -Description <String>
        A description of what this account will be used for.
        
        Required?                    false
        Position?                    4
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer and OutVariable. For more information, type,
        "get-help about_commonparameters".
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        You will need to run this with either UAC disabled or from an elevated prompt.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>New-LocalUser -ComputerName MyComputer -User MyUserAccount -Password MyP@ssw0rd -Descript
    ion "Account."
    
    
    Description
    -----------
    Creates a user named MyUserAccount on MyComputer.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/ComputerManagement#New-LocalUser



```
## Set-!Pass ##
```

NAME
    Set-Pass
    
SYNOPSIS
    Change the password of an existing user account.
    
SYNTAX
    Set-Pass [-ComputerName] <String> [-UserName] <String> [-Password] <String> [<CommonParameters>
    ]
    
    
DESCRIPTION
    This function will change the password for an existing user account.
    

PARAMETERS
    -ComputerName <String>
        The NetBIOS name of the computer that you will add the account to.
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -UserName <String>
        The user name of the account that will be created.
        
        Required?                    true
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -Password <String>
        The password for the account, this must follow password policies enforced
        on the destination computer.
        
        Required?                    true
        Position?                    3
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer and OutVariable. For more information, type,
        "get-help about_commonparameters".
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        You will need to run this with either UAC disabled or from an elevated prompt.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Set-Pass -ComputerName MyComputer -UserName MyUserAccount -Password N3wP@ssw0rd
    
    
    
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/ComputerManagement#Set-Pass



```
## Add-LocalUserToGroup ##
```

NAME
    Add-LocalUserToGroup
    
SYNOPSIS
    Add an existing user to a local group.
    
SYNTAX
    Add-LocalUserToGroup [-ComputerName] <String> [-User] <String> [-Group] <String> [<CommonParame
    ters>]
    
    
DESCRIPTION
    This function will add an existing user to an existing group.
    

PARAMETERS
    -ComputerName <String>
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -User <String>
        The user name of the account that will be created.
        
        Required?                    true
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -Group <String>
        The name of an existing group to add this user to.
        
        Required?                    true
        Position?                    3
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer and OutVariable. For more information, type,
        "get-help about_commonparameters".
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        You will need to run this with either UAC disabled or from an elevated prompt.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Add-LocalUserToGroup -ComputerName MyComputer -User MyUserAccount -Group Administrators
    
    
    
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/ComputerManagement#Add-LocalUserToGroup



```
## New-ScheduledTask ##
```

NAME
    New-ScheduledTask
    
SYNOPSIS
    Create a Scheduled Task on a computer.
    
SYNTAX
    New-ScheduledTask [-TaskName] <String> [-TaskRun] <String> [-TaskSchedule] <String> [-StartTime
    ] <String> [-StartDate] <String> [-TaskUser] <String> [-Server] <String> [<CommonParameters>]
    
    
DESCRIPTION
    Create a Scheduled Task on a local or remote computer.
    

PARAMETERS
    -TaskName <String>
        Specifies a name for the task.
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -TaskRun <String>
        Specifies the program or command that the task runs. Type 
        the fully qualified path and file name of an executable file, 
        script file, or batch file. If you omit the path, SchTasks.exe 
        assumes that the file is in the Systemroot\System32 directory.
        
        Required?                    true
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -TaskSchedule <String>
        Specifies the schedule type. Valid values are 
            MINUTE
            HOURLY
            DAILY
            WEEKLY
            MONTHLY
            ONCE
            ONSTART
            ONLOGON
            ONIDLE
        
        Required?                    true
        Position?                    3
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -StartTime <String>
        Specifies the time of day that the task starts in HH:MM:SS 24-hour 
        format. The default value is the current local time when the command 
        completes. The /st parameter is valid with MINUTE, HOURLY, DAILY, 
        WEEKLY, MONTHLY, and ONCE schedules. It is required with a ONCE 
        schedule.
        
        Required?                    true
        Position?                    4
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -StartDate <String>
        Specifies the date that the task starts in MM/DD/YYYY format. The 
        default value is the current date. The /sd parameter is valid with all 
        schedules, and is required for a ONCE schedule.
        
        Required?                    true
        Position?                    5
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -TaskUser <String>
        Runs the tasks with the permission of the specified user account. By 
        default, the task runs with the permissions of the user logged on to the 
        computer running SchTasks.
        
        Required?                    true
        Position?                    6
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -Server <String>
        The NetBIOS name of the computer to create the scheduled task on.
        
        Required?                    true
        Position?                    7
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer and OutVariable. For more information, type,
        "get-help about_commonparameters".
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        You will need to run this with either UAC disabled or from an elevated prompt.
        The full syntax of the command can be found here:
            http://technet.microsoft.com/en-us/library/bb490996.aspx
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>New-ScheduledTask -TaskName "Reboot Computer" -TaskRun "shutdown /r" -TaskSchedule ONCE `
    
    
    -StartTime "18:00:00" -StartDate "03/16/2011" -TaskUser SYSTEM -Server MyDesktopPC
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/ComputerManagement#New-ScheduledTask



```
## Remove-UserFromLocalGroup ##
```

NAME
    Remove-UserFromLocalGroup
    
SYNOPSIS
    Removes a user/group from a local computer group.
    
SYNTAX
    Remove-UserFromLocalGroup [-ComputerName] <String> [-UserName] <String> [-GroupName] <String> [
    <CommonParameters>]
    
    
DESCRIPTION
    Removes a user/group from a local computer group.
    

PARAMETERS
    -ComputerName <String>
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -UserName <String>
        
        Required?                    true
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -GroupName <String>
        Name of the group where that the user/group is a member of.
        
        Required?                    true
        Position?                    3
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer and OutVariable. For more information, type,
        "get-help about_commonparameters".
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        You will need to run this with either UAC disabled or from an elevated prompt.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Remove-UserFromLocalGroup -ComputerName MyComputer -UserName RandomUser
    
    
    Description
             -----------
             This example removes a user from the local administrators group.
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    C:\PS>Remove-UserFromLocalGroup -ComputerName MyComputer -UserName RandomUser -GroupName Users
    
    
    Description
    -----------
    This example removes a user from the local users group.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/ComputerManagement#Remove-UserFromLocalGroup



```
## Get-!Services ##
```

NAME
    Get-Services
    
SYNOPSIS
    Get a list of services
    
SYNTAX
    Get-Services [[-Computer] <String>] [[-Credential] <Object>] [[-State] <String>] [[-StartMode] 
    <String>] [<CommonParameters>]
    
    
DESCRIPTION
    This function returns a list of services on a given computer. This list can be filtered based o
    n the
    given StartMode  (ie. Running, Stopped) as well as filtered on StartMode (ie. Auto, Manual).
    

PARAMETERS
    -Computer <String>
        The NetBIOS name of the computer to retrieve services from
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -Credential <Object>
        
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -State <String>
        Most often this will be either Running or Stopped, but possible values include
            Running
            Stopped
            Paused
        
        Required?                    false
        Position?                    3
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -StartMode <String>
        Most often this will be either Auto or Manual, but possible values include
            Auto
            Manual
            Disabled
        
        Required?                    false
        Position?                    4
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer and OutVariable. For more information, type,
        "get-help about_commonparameters".
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        Depending on how you are setup you may need to provide credentials in order to access remot
        e machines
        You may need to have UAC disabled or run PowerShell as an administrator to see services loc
        ally
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Get-Services |Format-Table -AutoSize
    
    
    ExitCode Name                 ProcessId StartMode State   Status
    -------- ----                 --------- --------- -----   ------
            0 atashost                  1380 Auto      Running OK
            0 AudioEndpointBuilder       920 Auto      Running OK
            0 AudioSrv                   880 Auto      Running OK
            0 BFE                       1236 Auto      Running OK
            0 BITS                       964 Auto      Running OK
            0 CcmExec                   2308 Auto      Running OK
            0 CryptSvc                  1088 Auto      Running OK
        
    Description
    -----------
    This example shows the default options in place
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    C:\PS>Get-Services -State "stopped" |Format-Table -AutoSize
    
    
    ExitCode Name                           ProcessId StartMode State   Status
    -------- ----                           --------- --------- -----   ------
            0 AppHostSvc                             0 Auto      Stopped OK
            0 clr_optimization_v4.0.30319_32         0 Auto      Stopped OK
            0 clr_optimization_v4.0.30319_64         0 Auto      Stopped OK
            0 MMCSS                                  0 Auto      Stopped OK
            0 Net Driver HPZ12                       0 Auto      Stopped OK
            0 Pml Driver HPZ12                       0 Auto      Stopped OK
            0 sppsvc                                 0 Auto      Stopped OK
        
    Description
    -----------
    This example shows the output when specifying the state parameter
    
    
    
    
    
    -------------------------- EXAMPLE 3 --------------------------
    
    C:\PS>Get-Services -State "stopped" -StartMode "disabled" |Format-Table -AutoSize
    
    
    ExitCode Name                           ProcessId StartMode State   Status
    -------- ----                           --------- --------- -----   ------
        1077 clr_optimization_v2.0.50727_32         0 Disabled  Stopped OK
        1077 clr_optimization_v2.0.50727_64         0 Disabled  Stopped OK
        1077 CscService                             0 Disabled  Stopped OK
        1077 Mcx2Svc                                0 Disabled  Stopped OK
        1077 MSSQLServerADHelper100                 0 Disabled  Stopped OK
        1077 NetMsmqActivator                       0 Disabled  Stopped OK
        1077 NetPipeActivator                       0 Disabled  Stopped OK
        
    Description
    -----------
    This example shows how to specify a different state and startmode.
    
    
    
    
    
    -------------------------- EXAMPLE 4 --------------------------
    
    C:\PS>Get-Services -Computer dpm -Credential "Domain\Administrator" |Format-Table -AutoSize
    
    
    ExitCode Name                   ProcessId StartMode State   Status
    -------- ----                   --------- --------- -----   ------
            0 AppHostSvc                  1152 Auto      Running OK
            0 BFE                          564 Auto      Running OK
            0 CryptSvc                    1016 Auto      Running OK
            0 DcomLaunch                   600 Auto      Running OK
            0 Dhcp                         776 Auto      Running OK
            0 Dnscache                    1016 Auto      Running OK
            0 DPMAMService                1184 Auto      Running OK
        
    Description
    -----------
    This example shows how to specify a remote computer and credentials to authenticate with.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/ComputerManagement#Get-Services



```
## Get-NonStandardServiceAccounts ##
```

NAME
    Get-NonStandardServiceAccounts
    
SYNOPSIS
    Return a list of services using Non-Standard accounts.
    
SYNTAX
    Get-NonStandardServiceAccounts [[-Computer] <String>] [[-Credentials] <Object>] [[-Filter] <Str
    ing>] [<CommonParameters>]
    
    
DESCRIPTION
    This function returns a list of services from local or remote coputers that have non-standard
    user accounts for logon credentials.
    

PARAMETERS
    -Computer <String>
        The NetBIOS name of the computer to pull services from.
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -Credentials <Object>
        The DOMAIN\USERNAME of an account with permissions to access services.
        
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -Filter <String>
        This is a pipe (|) seperated list of accounts to filter out of the returned services list.
        
        Required?                    false
        Position?                    3
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer and OutVariable. For more information, type,
        "get-help about_commonparameters".
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        Powershell may need to be run elevated to run this script.
        UAC may need to be disabled to run this script.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Get-NonStandardServiceAccounts
    
    
    StartName                         Name                             DisplayName
    ---------                         ----                             -----------
    .\Jeff Patton                     MyService                        My Test Service
        
    Description
    -----------
    This example shows no parameters provided
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    C:\PS>Get-NonStandardServiceAccounts -Computer dpm -Credentials $Credentials
    
    
    StartName                         Name                             DisplayName
    ---------                         ----                             -----------
    .\MICROSOFT$DPM$Acct              MSSQL$MS$DPM2007$                SQL Server (MS$DPM2007$)
    .\MICROSOFT$DPM$Acct              MSSQL$MSDPM2010                  SQL Server (MSDPM2010)
    NT AUTHORITY\NETWORK SERVICE      MSSQLServerADHelper100           SQL Active Directory Helper 
    S...
    NT AUTHORITY\NETWORK SERVICE      ReportServer$MSDPM2010           SQL Server Reporting Service
    s...
    .\MICROSOFT$DPM$Acct              SQLAgent$MS$DPM2007$             SQL Server Agent (MS$DPM2007
    $)
    .\MICROSOFT$DPM$Acct              SQLAgent$MSDPM2010               SQL Server Agent (MSDPM2010)
        
    Description
    -----------
    This example shows all parameters in use
    
    
    
    
    
    -------------------------- EXAMPLE 3 --------------------------
    
    C:\PS>Get-NonStandardServiceAccounts -Computer dpm -Credentials $Credentials `
    
    
    -Filter "localsystem|NT Authority\LocalService|NT Authority\NetworkService|NT AUTHORITY\NETWORK
     SERVICE"
    
    StartName                         Name                             DisplayName
    ---------                         ----                             -----------
    .\MICROSOFT$DPM$Acct              MSSQL$MS$DPM2007$                SQL Server (MS$DPM2007$)
    .\MICROSOFT$DPM$Acct              MSSQL$MSDPM2010                  SQL Server (MSDPM2010)
    .\MICROSOFT$DPM$Acct              SQLAgent$MS$DPM2007$             SQL Server Agent (MS$DPM2007
    $)
    .\MICROSOFT$DPM$Acct              SQLAgent$MSDPM2010               SQL Server Agent (MSDPM2010)
        
    Description
    -----------
    This example uses the Filter parameter to filter out NT AUTHORITY\NETWORK SERVICE account from 
    the
    preceeding example. 
        
    The back-tick (`) was used for readability purposes only.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/ComputerManagement#Get-NonStandardServiceAccounts



```
## Remove-LocalUser ##
```

NAME
    Remove-LocalUser
    
SYNOPSIS
    Delete a user account from the local computer.
    
SYNTAX
    Remove-LocalUser [-ComputerName] <Object> [-UserName] <Object> [<CommonParameters>]
    
    
DESCRIPTION
    This function will delete a user account from the local computer
    

PARAMETERS
    -ComputerName <Object>
        The NetBIOS name of the computer the account is found on
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -UserName <Object>
        The username to delete
        
        Required?                    true
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer and OutVariable. For more information, type,
        "get-help about_commonparameters".
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        The user context the script is run under must be able to delete accounts on the remote comp
        uter
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Remove-LocalUser -ComputerName Desktop -UserName TestAcct
    
    
    Description
    -----------
    Basic syntax of the command.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/ComputerManagement#Remove-LocalUser



```
## Get-LocalUserAccounts ##
```

NAME
    Get-LocalUserAccounts
    
SYNOPSIS
    Return a list of local user accounts.
    
SYNTAX
    Get-LocalUserAccounts [[-ComputerName] <String>] [[-Credentials] <PSCredential>] [<CommonParame
    ters>]
    
    
DESCRIPTION
    This function returns the Name and SID of any local user accounts that are found
    on the remote computer.
    

PARAMETERS
    -ComputerName <String>
        The NetBIOS name of the remote computer
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -Credentials <PSCredential>
        
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer and OutVariable. For more information, type,
        "get-help about_commonparameters".
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        You will need to provide credentials when running this against computers in a diffrent doma
        in.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Get-LocalUserAccounts -ComputerName Desktop-PC01
    
    
    Name                                                      SID                                  
                                                    
    ----                                                      ---                                  
                                                    
    Administrator                                             S-1-5-21-1168524473-3979117187-415311
    5970-500
    Guest                                                     S-1-5-21-1168524473-3979117187-415311
    5970-501
        
    Description
    -----------
    This example shows the basic usage
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    C:\PS>Get-LocalUserAccounts -ComputerName citadel -Credentials $Credentials
    
    
    Name                                                      SID
    ----                                                      ---
    Administrator                                             S-1-5-21-1168524473-3979117187-415311
    5970-500
    Guest                                                     S-1-5-21-1168524473-3979117187-415311
    5970-501
        
    Description
    -----------
    This example shows using the optional Credentials variable to pass administrator credentials
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/ComputerManagement#Get-LocalUserAccounts



```
## Get-PendingUpdates ##
```

NAME
    Get-PendingUpdates
    
SYNOPSIS
    Retrieves the updates waiting to be installed from WSUS
    
SYNTAX
    Get-PendingUpdates [[-ComputerName] <String>] [<CommonParameters>]
    
    
DESCRIPTION
    Retrieves the updates waiting to be installed from WSUS
    

PARAMETERS
    -ComputerName <String>
        Computer or computers to find updates for.
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue)
        Accept wildcard characters?  
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer and OutVariable. For more information, type,
        "get-help about_commonparameters".
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        Author: Boe Prox
        Date Created: 05Mar2011
        RPC Dynamic Ports need to be enabled on inbound remote servers.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Get-PendingUpdates
    
    
    Description
    -----------
    Retrieves the updates that are available to install on the local system
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/ComputerManagement#Get-PendingUpdates



```
## Get-ServiceTag ##
```

NAME
    Get-ServiceTag
    
SYNOPSIS
    Get the serial number (Dell ServiceTag) from Win32_BIOS
    
SYNTAX
    Get-ServiceTag [[-ComputerName] <Object>] [<CommonParameters>]
    
    
DESCRIPTION
    This function grabs the SerialNumber property from Win32_BIOS for the 
    provided ComputerName
    

PARAMETERS
    -ComputerName <Object>
        The NetBIOS name of the computer.
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer and OutVariable. For more information, type,
        "get-help about_commonparameters".
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        This space intentionally left blank.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Get-ServiceTag -ComputerName Desktop-01
    
    
    SerialNumber
    ------------
    1AB2CD3
    
    Description
    -----------
    An example showing the only parameter.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/ComputerManagement#Get-ServiceTag



```
## Backup-EventLogs ##
```

NAME
    Backup-EventLogs
    
SYNOPSIS
    Backup Eventlogs from remote computer
    
SYNTAX
    Backup-EventLogs [[-ComputerName] <String>] [[-LogPath] <String>] [[-BackupPath] <String>] [<Co
    mmonParameters>]
    
    
DESCRIPTION
    This function copies event log files from a remote computer to a backup location.
    

PARAMETERS
    -ComputerName <String>
        The NetBIOS name of the computer to connect to.
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -LogPath <String>
        The path to the logs you wish to backup. The default logpath "C:\Windows\system32\winevt\Lo
        gs"
        is used if left blank.
        
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -BackupPath <String>
        The location to copy the logs to.
        
        Required?                    false
        Position?                    3
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer and OutVariable. For more information, type,
        "get-help about_commonparameters".
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        May need to be a user with rights to access various logs, such as security on remote comput
        er.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Backup-EventLogs -ComputerName dc1
    
    
    
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/ComputerManagement#Backup-EventLogs



```
## Export-EventLogs ##
```

NAME
    Export-EventLogs
    
SYNOPSIS
    Export Eventlogs from remote computer
    
SYNTAX
    Export-EventLogs [[-ComputerName] <String>] [<CommonParameters>]
    
    
DESCRIPTION
    This function backs up all logs on a Windows computer that have events written in them. This
    log is stored as a .csv file in the current directory, where the filename is the ComputerName+
    Logname+Date+Time the backup was created.
    

PARAMETERS
    -ComputerName <String>
        The NetBIOS name of the computer to connect to.
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer and OutVariable. For more information, type,
        "get-help about_commonparameters".
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        May need to be a user with rights to access various logs, such as security on remote comput
        er.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Export-EventLogs -ComputerName dc1
    
    
    
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/ComputerManagement#Export-EventLogs



```
## Get-!SiSReport ##
```

NAME
    Get-SiSReport
    
SYNOPSIS
    Get the overall SIS usage information.
    
SYNTAX
    Get-SiSReport [[-SisDisk] <Object>] [<CommonParameters>]
    
    
DESCRIPTION
    This function uses the sisadmin command to get the usage
    information for a SIS enabled drive.
    

PARAMETERS
    -SisDisk <Object>
        The drive letter of a disk that has SiS enabled
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer and OutVariable. For more information, type,
        "get-help about_commonparameters".
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        This function will return nothing if the drive being analyzed does not have SiS enabled
        This function will return a message if the sisadmin command returns any error
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Get-SiSReport -SisDisk o
    
    
    LinkFiles             : 20004
    Used                  : 442378481664
    Disk                  : o
    InaccessibleLinkFiles : 0
    CommonStoreFiles      : 6678
    SpaceSaved            : 7708860 KB
    Free                  : 0
    
    Description
    -----------
    This example shows the basic usage of the command
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/ComputerManagement#Get-SiSReport



```
## Get-PaperCutLogs ##
```

NAME
    Get-PaperCutLogs
    
SYNOPSIS
    Get PaperCut logs from all print servers
    
SYNTAX
    Get-PaperCutLogs [[-PrintServers] <Object>] [<CommonParameters>]
    
    
DESCRIPTION
    Return the PaperCut logs from all print servers.
    

PARAMETERS
    -PrintServers <Object>
        The FQDN of the print servers
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer and OutVariable. For more information, type,
        "get-help about_commonparameters".
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        You must have downlaoded and installed the latest version of PaperCut Print Logger
        for this to work.
        
        http://www.papercut.com/products/free_software/print_logger/#
        
        The resulting data will encompass all months that the servers have been logging data  
        for, currently this goes back about 3 years. The CSV output can be opened in Excel  
        and you can generate graphs based on which printer is used the most, how much paper  
        is consumed by each printer and so on.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Get-PaperCutLogs |Export-Csv -Path .\PrintLog.csv
    
    
    Description
    -----------
    This example shows the basic usage of the command. The output is piped into
    a spreadsheet on the local computer for further analysis.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/ComputerManagement#Get-PaperCutLogs



```
## Set-ShutdownMethod ##
```

NAME
    Set-ShutdownMethod
    
SYNOPSIS
    Execute the Win32Shutdown method on a remote computer
    
SYNTAX
    Set-ShutdownMethod [-ComputerName] <String> [[-Credentials] <Object>] [[-ShutdownMethod] <Int32
    >] [<CommonParameters>]
    
    
DESCRIPTION
    This function executes the Win32Shutdown method on a remote computer. This
    can be either an IP, NetBIOS name or FQDN. Use the ShutdownMethod param to
    specify the type of shutdown.
    

PARAMETERS
    -ComputerName <String>
        The IP, NetBIOS or FQDN of the remote computer.
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue)
        Accept wildcard characters?  
        
    -Credentials <Object>
        
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -ShutdownMethod <Int32>
        Win32Shutdown accepts one of the following in32's
            0 = Logoff (Default)
            1 = Shutdown 
            2 = Reboot
            4 = Force Logoff (Doesn't work)
            8 = PowerOff
        
        For more information see the following MSDN article
        http://msdn.microsoft.com/en-us/library/aa376868(VS.85).aspx
        
        Required?                    false
        Position?                    3
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer and OutVariable. For more information, type,
        "get-help about_commonparameters".
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        You will need proper credentials on the remote machine for this to work.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Set-ShutdownMethod -ComputerName Desktop-pc01
    
    
    Description
    -----------
    This is the default syntax for this command
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    C:\PS>Set-ShutdownMethod -ComputerName Desktop-pc01 -ShutdownMethod 0
    
    
    Description
    -----------
    This is the only syntax for this command
    
    
    
    
    
    -------------------------- EXAMPLE 3 --------------------------
    
    C:\PS>Get-WmiObject -Class Win32_ServerSession -ComputerName $ComputerName | Set-ShutdownMethod
    
    
    Description
    -----------
    An example showing how to pipe information into the function.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/ComputerManagement#Set-ShutdownMethod



```
## Get-PrinterLogs ##
```

NAME
    Get-PrinterLogs
    
SYNOPSIS
    Get a log of all printing from a given server.
    
SYNTAX
    Get-PrinterLogs [[-LogName] <Object>] [-ComputerName] <Object> [<CommonParameters>]
    
    
DESCRIPTION
    This function will return a log of all the printing that has occurred on
    a given print server.
    

PARAMETERS
    -LogName <Object>
        The default log for printing on Windows Server 2008 R2 is specified.
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -ComputerName <Object>
        The name of your print server.
        
        Required?                    true
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer and OutVariable. For more information, type,
        "get-help about_commonparameters".
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        The following log will need to be enabled before logs can be generated by the server:
        "Microsoft-Windows-PrintService/Operational"
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Get-PrinterLogs -ComputerName ps
    
    
    Size     : 96060
    Time     : 8/16/2011 5:01:09 PM
    User     : MyAccount
    Job      : 62
    Client   : \\10.133.5.143
    Port     : Desktop-PC01.company.com
    Printer  : HP-Laser
    Pages    : 1
    Document : Microsoft Office Outlook - Memo Style
    
    Description
    -----------
    This example shows the basic usage of the command.
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    C:\PS>Get-PrinterLogs -ComputerName ps |Export-Csv -Path .\PrintLogs.csv
    
    
    Description
    -----------
    This is the syntax that I would see being used the most.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/ComputerManagement#Get-PrinterLogs



```
## Get-OpenSessions ##
```

NAME
    Get-OpenSessions
    
SYNOPSIS
    Return a list of open sessions
    
SYNTAX
    Get-OpenSessions [[-ComputerName] <Object>] [<CommonParameters>]
    
    
DESCRIPTION
    This function returns a list of open session on a given server. The output is 
    similar to that of the Manage Open Sessions dialog in the Share and Storage
    Management console.
    

PARAMETERS
    -ComputerName <Object>
        This is the FQDN or NetBIOS name of the computer
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer and OutVariable. For more information, type,
        "get-help about_commonparameters".
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        FunctionName : Get-OpenSessions
        Created by   : Jeff Patton
        Date Coded   : 09/26/2011 11:35:40
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Get-OpenSessions -ComputerName fs
    
    
    User          Computer         ConnectTime     IdleTime
    ----          --------         -----------     --------
    user1         10.10.1.62              1615            1
    user2         10.10.1.156             7529           17
    
    Description
    -----------
    This example shows the basic usage of the command.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/ComputerManagement#Get-OpenSessions



```
## Get-OpenFiles ##
```

NAME
    Get-OpenFiles
    
SYNOPSIS
    Get a list of files open on the server
    
SYNTAX
    Get-OpenFiles [[-ComputerName] <Object>] [<CommonParameters>]
    
    
DESCRIPTION
    This function returns a list of files open on a given server. The output is
    similar to that of the Manage Open Files from the Share and Storage Management
    console.
    

PARAMETERS
    -ComputerName <Object>
        The NetBIOS or FQDN of the computer
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer and OutVariable. For more information, type,
        "get-help about_commonparameters".
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        FunctionName : Get-OpenFiles
        Created by   : Jeff Patton
        Date Coded   : 09/26/2011 13:01:38
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Get-OpenFiles -ComputerName fs
    
    
    User          Path                              LockCount
    ----          ----                              ---------
    User1         F:\Users\User1\Documents\Data\...         0
    User2         P:\Public                                 0
    
    Description
    -----------
    This example shows the basic usage of this command.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/ComputerManagement#Get-OpenFiles



```
## Get-RDPLoginEvents ##
```

NAME
    Get-RDPLoginEvents
    
SYNOPSIS
    Return Remote Desktop login attempts
    
SYNTAX
    Get-RDPLoginEvents [-ComputerName] <Object> [[-Credentials] <Object>] [[-EventID] <Object>] [[-
    LogName] <Object>] [<CommonParameters>]
    
    
DESCRIPTION
    This function returns login attempts from the Microsoft Windows TerminalServices RemoteConnecti
    onManager 
    log. The specific events are logged as EventID 1149, and they are logged whether or not the use
    r actually
    gets to the desktop.
    

PARAMETERS
    -ComputerName <Object>
        This is the NetBIOS name of the computer to pull events from.
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue)
        Accept wildcard characters?  
        
    -Credentials <Object>
        A user account with the ability to retreive these events.
        
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -EventID <Object>
        
        Required?                    false
        Position?                    3
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -LogName <Object>
        
        Required?                    false
        Position?                    4
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer and OutVariable. For more information, type,
        "get-help about_commonparameters".
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        The Microsoft-Windows-TerminalServices-RemoteConnectionManager/Operational needs to be enab
        led
        The user account supplied in $Credentials needs to have permission to view this log
        No output is returned if the log is empty.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Get-RDPLoginEvents -Credentials $Credentials |Export-Csv -Path C:\logfiles\RDP-Attempts.c
    sv
    
    
    Description
    -----------
    This example show piping the output of the function to Export-Csv to create a file suitable for
     import
    into Excel, or some other spreadsheet software.
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    C:\PS>Get-RDPLoginEvents -Credentials $Credentials -ComputerName MyPC |Format-Table
    
    
    SourceNetworkAddress        Domain           TimeCreated                User
    --------------------        ------           -----------                ----
    192.168.1.1                 MyPC...          4/30/2011 8:20:02 AM       Administrator...
    192.168.1.1                 MyPC...          4/28/2011 4:53:01 PM       Administrator...
    192.168.1.1                 MyPC...          4/21/2011 2:01:42 PM       Administrator...
    192.168.1.1                 MyPC...          4/19/2011 11:42:59 AM      Administrator...
    192.168.1.1                 MyPC...          4/19/2011 10:30:52 AM      Administrator...
    
    Description
    -----------
    This example shows piping the output to Format-Table
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/ComputerManagement#Get-RDPLoginEvents



```
## Get-InvalidLogonAttempts ##
```

NAME
    Get-InvalidLogonAttempts
    
SYNOPSIS
    Return a list of invalid logon attempts.
    
SYNTAX
    Get-InvalidLogonAttempts [-ComputerName] <Object> [[-LogName] <Object>] [[-EventID] <Object>] [
    <CommonParameters>]
    
    
DESCRIPTION
    This function queries the security log of a given computer and 
    retrieves Event ID 4625, failed logon attempt.
    

PARAMETERS
    -ComputerName <Object>
        The name of the computer to pull logs from
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue)
        Accept wildcard characters?  
        
    -LogName <Object>
        The name of the Event Log.
        
        You will notice that I have set the LogName to Security, since
        this particular script was designed to find a specific entry.
        This can be modified to suit your needs.
        
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -EventID <Object>
        The Event ID to return.
        
        You will notice that I have set the EventID to 4625, since
        this particular script was designed to find those particular
        entries. This can be modified to suit your needs.
        
        Required?                    false
        Position?                    3
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer and OutVariable. For more information, type,
        "get-help about_commonparameters".
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        ScriptName : Get-InvalidLogonAttempts
        Created By : jspatton
        Date Coded : 10/26/2011 11:20:58
        ScriptName is used to register events for this script
        LogName is used to determine which classic log to write to
        
        ErrorCodes
            100 = Success
            101 = Error
            102 = Warning
            104 = Information
        
        If you adjust theh script to look for event id's other than 4625, you will
        want to examine the Event Properties. This is similar to viewing the 
        "Friendly" view of an event in the event log. Below are all the properties
        for Event ID 4625.
        
        00  SubjectUserSid S-1-5-18 
        01  SubjectUserName NODE1$ 
        02  SubjectDomainName SOECS 
        03  SubjectLogonId 0x3e7 
        04  TargetUserSid S-1-0-0 
        05  TargetUserName Daniel 
        06  TargetDomainName NODE1 
        07  Status 0xc000006d 
        08  FailureReason %%2313 
        09  SubStatus 0xc0000064 
        10  LogonType 10 
        11  LogonProcessName User32  
        12  AuthenticationPackageName Negotiate 
        13  WorkstationName NODE1 
        14  TransmittedServices - 
        15  LmPackageName - 
        16  KeyLength 0 
        17  ProcessId 0x3278 
        18  ProcessName C:\Windows\System32\winlogon.exe 
        19  IpAddress ##.###.###.### 
        20  IpPort 51144
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Get-InvalidLogonAttempts -ComputerName Desktop-pc1 -LogName 'Security' -EventID 4625
    
    
    Message        MachineName    TimeCreated   IpAddress         LogonType TargetUserNam IpPort
                                                                            e
    -------        -----------    -----------   ---------         --------- ------------- ------
    An account ... Desktop-pc1... 10/26/2011... ##.###.###...            10 Daniel        62581
    An account ... Desktop-pc1... 10/26/2011... ##.###.###...            10 Daniel        11369
    An account ... Desktop-pc1... 10/26/2011... ##.###.###...            10 Daniel        47575
    An account ... Desktop-pc1... 10/26/2011... ##.###.###...            10 Daniel        51144
    
    Description
    -----------
    This is the basic syntax of the command, the output is returned to stdin.
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    C:\PS>Get-InvalidLogonAttempts |Export-Csv -Path .\InvalidLoginAttempts.csv
    
    
    Description
    -----------
    This example shows redirecting the output through the Export-CSV command to get
    a csv file.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/ComputerManagement#Get-InvalidLogonAttempts



```
## Get-UpTime ##
```

NAME
    Get-UpTime
    
SYNOPSIS
    Get uptime of one or more computers
    
SYNTAX
    Get-UpTime [-ComputerName] <Object> [<CommonParameters>]
    
    
DESCRIPTION
    This script uses Win32_ComputerSystem to determine how long your system has been running.
    

PARAMETERS
    -ComputerName <Object>
        One or more computer names
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue)
        Accept wildcard characters?  
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer and OutVariable. For more information, type,
        "get-help about_commonparameters".
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        FunctionName : Get-UpTime
        Created by   : jspatton
        Date Coded   : 10/19/2011 11:22:34
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Get-UpTime -ComputerName ".", "server01" |Sort-Object -Property Days -Descending
    
    
    ComputerName Days Hours Minutes
    ------------ ---- ----- -------
    server01       39    18      25
    Desktop01       0     1      38
    
    Description
    -----------
    This example shows using the function with an array of computer names, and sorting the output
    descending order by days.
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    C:\PS>$Servers | foreach {Get-UpTime $_.Properties.name} |Sort-Object -Property Days -Descendin
    g
    
    
    ComputerName    Days Hours Minutes
    ------------    ---- ----- -------
    server01         144    22      58
    server02         144    22      16
    server03         144    23       9
    server04         139    22      42
    
    Description
    -----------
    This example shows passing in computer computer names from an object.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/ComputerManagement#Get-UpTime
     http://msdn.microsoft.com/en-us/library/aa394591(VS.85).aspx



```