# !New-LocalAdmin.ps1 #
```

NAME
    C:\mod-posh\powershell\production\New-LocalAdmin.ps1
    
SYNOPSIS
    Creates a new local admin account on a remote computer
    
SYNTAX
    C:\mod-posh\powershell\production\New-LocalAdmin.ps1 [-ADSPath] <String> [[-GroupName] <String>
    ] [-UserAccount] <String> [-UserPass] <String> [[-Description] <String>] [<CommonParameters>]
    
    
DESCRIPTION
    This script creates a new local user account on domain joined computers.
    

PARAMETERS
    -ADSPath <String>
        The LDAP URI to the collection of computers to update.
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -GroupName <String>
        The name of the group to add the user to, the default is the Administrators group.
        
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -UserAccount <String>
        
        Required?                    true
        Position?                    3
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -UserPass <String>
        The new user account password
        
        Required?                    true
        Position?                    4
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -Description <String>
        An optional description of the account to be created.
        
        Required?                    false
        Position?                    5
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
    
    
        ScriptName: New-LocalAdmin.ps1
        Created By: Jeff Patton
        Date Coded: May 31, 2011
        ScriptName is used to register events for this script
        LogName is used to determine which classic log to write to
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>
    
    
    
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/New-LocalAdmin



```