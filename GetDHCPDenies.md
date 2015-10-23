# !Get-DHCPDenies.ps1 #
```

NAME
    C:\mod-posh\powershell\production\Get-DHCPDenies.ps1
    
SYNOPSIS
    Return host denied lease
    
SYNTAX
    C:\mod-posh\powershell\production\Get-DHCPDenies.ps1 [-EventID] <Object> [<CommonParameters>]
    
    
DESCRIPTION
    This script works in conjunction with an Event Trigger on the 
    Microsoft-Windows-Dhcp-Server/FilterNotifications log on our 
    DHCP server. This script queries the Microsoft-Windows-Dhcp-Server/FilterNotifications
    log for EventID 20097, and returns the MAC, Hostname, HardwareType, Time and Message
    of the event. 
    
    This should be the same event that triggered this script to
    run in the first place.
    
    It outputs an XML file to the C:\LogFiles directory which exists on
    the server, if not it creates the folder.
    

PARAMETERS
    -EventID <Object>
        
        Required?                    true
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
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Get-DHCPDenies.ps1
    
    
    Description
    -----------
    This is the only syntax for this script.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/GetDHCPDenies



```