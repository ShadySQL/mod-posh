# !Get-DomainUsers.ps1 #
```

NAME
    C:\mod-posh\powershell\production\Get-DomainUsers.ps1
    
SYNOPSIS
    Return a list of user accounts from the domain.
    
SYNTAX
    C:\mod-posh\powershell\production\Get-DomainUsers.ps1 [[-ADSPath] <Object>] [[-SearchFilter] <O
    bject>] [[-ADProperties] <Object>] [<CommonParameters>]
    
    
DESCRIPTION
    This script uses the Get-ADObjects function to return a list of user objects. The
    name, pwdLastSet, userAccountControle, adsPath and lastLogonTimestamp are returned.
    

PARAMETERS
    -ADSPath <Object>
        The LDAP URL of your current domain
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -SearchFilter <Object>
        What to filter your query on
        
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -ADProperties <Object>
        A list of properties to return from AD
        
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
    
    
        ScriptName: Get-DomainUsers
        Created By: Jeff Patton
        Date Coded: 06/17/2011
        ScriptName is used to register events for this script
        LogName is used to determine which classic log to write to
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Get-DomainUsers |Export-Csv -Path ./DomainUsers.csv -NoTypeInformation
    
    
    
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/Get-DomainUsers



```