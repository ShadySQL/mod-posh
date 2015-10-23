# !Delete-LocalAccount.ps1 #
```

NAME
    C:\mod-posh\powershell\production\Delete-LocalAccount.ps1
    
SYNOPSIS
    A script that removes a local user account
    
SYNTAX
    C:\mod-posh\powershell\production\Delete-LocalAccount.ps1 [-ADSPath] <String> [-LocalUser] <Str
    ing> [<CommonParameters>]
    
    
DESCRIPTION
    This script searches ActiveDirectory for computer accounts, for each
    computer account it removes the specified user account.
    

PARAMETERS
    -ADSPath <String>
        The ActiveDirectory namespace to search for computers
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -LocalUser <String>
        
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
    
    
        This script requires the ComputerManagement and ActiveDirectoryManagement libraries
        The script registers it's name as an event-source on the source computer and writes
        events to the application log.
        This script assumes the includes folder is a subfolder of the current directory, if that
        is not the case you may receive a FullyQualifiedErrorId : CommandNotFoundException when
        attempting to dot-source in the libraries.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>.\Delete-LocalAccount.ps1 -ADSPath "LDAP://OU=workstations,DC=company,DC=com" -LocalUser 
    delete `
    
    
    | Export-Csv .\sample.csv -NoTypeInformation
    
    Description
    -----------
    This example shows all parameters and piping the output to export-csv
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/DeleteLocalAccount
     https://code.google.com/p/mod-posh/wiki/ComputerManagemenet
     https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement



```