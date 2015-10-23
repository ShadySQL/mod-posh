# !Update-AdminPassword.ps1 #
```

NAME
    C:\mod-posh\powershell\production\Update-AdminPassword.ps1
    
SYNOPSIS
    Local administrator password update
    
SYNTAX
    C:\mod-posh\powershell\production\Update-AdminPassword.ps1 [-ADSPath] <String> [-AdminAccount] 
    <String> [-NewPassword] <String> [<CommonParameters>]
    
    
DESCRIPTION
    This script changes the local administrator password.
    

PARAMETERS
    -ADSPath <String>
        The ActiveDirectory namespace to search for computers
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -AdminAccount <String>
        The username of the administrator account
        
        Required?                    true
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -NewPassword <String>
        The new password
        
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
    
    
        ScriptName is used to register events for this script
        LogName is used to determine which classic log to write to
        This script assumes that the includes folder contains the libraries needed for this script 
        to work.
        I've not added credentials for this, so it will need to be run from an account that has the
         ability to 
        change passwords on your computers.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>.\Update-AdminPassword.ps1 -ADSPath "LDAP://DC=company,DC=com" -AdminAccount "administrat
    or" `
    
    
    -NewPassword "N3wp@ssw0rd" |Export-Csv .\sample.csv -NoTypeInformation
    
    Description
    -----------
    This example shows all parameters being used with the output being piped to a spreadsheet.
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    C:\PS>.\Update-AdminPassword.ps1 -ADSPath "LDAP://OU=TestOU,DC=company,Dc=com" -AdminAccount Ad
    ministrator `
    
    
    -NewPassword Pass12345
    
    ComputerName    UserName        Status
    ------------    --------        ------
    L1132C-VM01     Administrator   The network path was not found.
    l1132c-pc17     Administrator   The user name could not be found.
    l1132c-pc05     Administrator   Access is denied.
    L1132C-PC01     Administrator   Password updated
    
    Description
    -----------
    This shows an example of the output
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/UpdateAdminPassword
     https://code.google.com/p/mod-posh/wiki/ComputerManagemenet
     https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement



```