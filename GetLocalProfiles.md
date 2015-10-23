# !Get-LocalProfiles.ps1 #
```

NAME
    C:\mod-posh\powershell\production\Get-LocalProfiles.ps1
    
SYNOPSIS
    Get a count of local profiles
    
SYNTAX
    C:\mod-posh\powershell\production\Get-LocalProfiles.ps1 [[-ADSPath] <Object>] [<CommonParameter
    s>]
    
    
DESCRIPTION
    This scrpit displays a count of the users who have logged in to each
    computer.
    

PARAMETERS
    -ADSPath <Object>
        The LDAP URL to where the computers you are interested in are located
        in the directory.
        
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
    
    
        ScriptName : Get-LocalProfiles
        Created By : jspatton
        Date Coded : 10/06/2011 08:48:37
        ScriptName is used to register events for this script
        LogName is used to determine which classic log to write to
        
        ErrorCodes
            100 = Success
            101 = Error
            102 = Warning
            104 = Information
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>.\Get-LocalProfiles.ps1 -ADSPath 'OU=Workstations,OU=ADmin,DC=company,DC=com'
    
    
    
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/Get-LocalProfiles



```