# !Find-LocalAdmins.ps1 #
```

NAME
    C:\mod-posh\powershell\production\Find-LocalAdmins.ps1
    
SYNOPSIS
    List users in specified local group
    
SYNTAX
    C:\mod-posh\powershell\production\Find-LocalAdmins.ps1 [-ADSPath] <String> [-GroupName] <String
    > [<CommonParameters>]
    
    
DESCRIPTION
    Created: March 17, 2011 Jeff Patton
    This script searches ActiveDirectory for computers. It then queries each computer for the list 
    of users who 
    are in the local Administrators group.
    

PARAMETERS
    -ADSPath <String>
        The LDAP URI of the container you wish to pull computers from.
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -GroupName <String>
        The name of the local group to pull membership pfrom.
        
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
    
    
        You will need to run this script as an administrator or disable UAC to update the event-log
        You will need to have at least Read permissions in the AD container in order to get a list 
        of computers.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>find-localadmins "LDAP://OU=Workstations,DC=company,DC=com"
    
    
    
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/FindLocalAdmins



```