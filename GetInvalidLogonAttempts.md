# !Get-InvalidLogonAttempts.ps1 #
```

NAME
    C:\mod-posh\powershell\production\Get-InvalidLogonAttempts.ps1
    
SYNOPSIS
    Return a list of invalid logon attempts.
    
SYNTAX
    C:\mod-posh\powershell\production\Get-InvalidLogonAttempts.ps1 [[-ComputerName] <Object>] [[-Lo
    gName] <Object>] [[-EventID] <Object>] [<CommonParameters>]
    
    
DESCRIPTION
    This script queries the security log of a given computer and 
    retrieves Event ID 4625, failed logon attempt.
    

PARAMETERS
    -ComputerName <Object>
        The name of the computer to pull logs from
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       false
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
    
    
        ScriptName : Get-InvalidLogonAttempts.ps1
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
        19  IpAddress 75.127.226.131 
        20  IpPort 51144
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>.\Get-InvalidLogonAttempts.ps1 -ComputerName Desktop-pc1 -LogName 'Security' -EventID 462
    5
    
    
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
    
    C:\PS>.\Get-InvalidLogonAttempts.ps1 |Export-Csv -Path .\InvalidLoginAttempts.csv
    
    
    Description
    -----------
    This example shows redirecting the output through the Export-CSV command to get
    a csv file.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/Get-InvalidLogonAttempts



```