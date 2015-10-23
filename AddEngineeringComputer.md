# !Add-EngineeringComputer.ps1 #
```

NAME
    C:\mod-posh\powershell\production\Add-EngineeringComputer.ps1
    
SYNOPSIS
    Add Metadata to allow filter on DHCP
    
SYNTAX
    C:\mod-posh\powershell\production\Add-EngineeringComputer.ps1 [[-DHCPServer] <Object>] [[-MacAd
    dress] <Object>] [[-ComputerName] <Object>] [[-Department] <Object>] [[-Owner] <Object>] [[-Ser
    ial] <Object>] [<CommonParameters>]
    
    
DESCRIPTION
    This script adds metadata about the computer to
    the description property of an allow filter.
    

PARAMETERS
    -DHCPServer <Object>
        FQDN of local DHCP server
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -MacAddress <Object>
        Valid MAC Address
        
        Examples
        --------
        AA:BB:CC:DD:EE:FF
        AA-BB-CC-DD-EE-FF
        AABBCCDDEEFF
        
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -ComputerName <Object>
        The Netbios name of the computer to add
        
        Required?                    false
        Position?                    3
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -Department <Object>
        What department does this computer belong to
        
        Required?                    false
        Position?                    4
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -Owner <Object>
        Who is the primary user or departmental IT person
        
        Required?                    false
        Position?                    5
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -Serial <Object>
        Serial number of the computer
        
        Required?                    false
        Position?                    6
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
    
    
        ScriptName : Add-EngineeringComputer.ps1
        Created By : jspatton
        Date Coded : 10/10/2011 15:57:22
        ScriptName is used to register events for this script
        LogName is used to determine which classic log to write to
        
        ErrorCodes
            100 = Success
            101 = Error
            102 = Warning
            104 = Information
        
        Really more of an internal script but is useful for anyone else. This
        script leverages the fine work that Jeremy Engle has done on his 
        DHCP Module (see second link). You will need to download that module
        and copy it to your modules folder for this to work.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>.\Add-EngineeringComputer.ps1 -DHCPServer dhcp.company.com
    
    
    -MacAddress aabbccddeeff 
                                -ComputerName Desktop-01 
                                -Department Admin 
                                -Owner 'Jeff Patton' 
                                -Serial 8675309
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/Add-EngineeringComputer
     http://gallery.technet.microsoft.com/05b1d766-25a6-45cd-a0f1-8741ff6c04ec



```