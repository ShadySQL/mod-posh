# !Get-AllADGroups.ps1 #
```

NAME
    C:\mod-posh\powershell\production\Get-AllADGroups.ps1
    
SYNOPSIS
    Return all group members in each group
    
SYNTAX
    C:\mod-posh\powershell\production\Get-AllADGroups.ps1 [-ADSPath] <String> [<CommonParameters>]
    
    
DESCRIPTION
    This script returns all the members of each group in a provided AD Path. If you pass in just an
     OU
    it will return all the groups and members in that OU.
    

PARAMETERS
    -ADSPath <String>
        This is an LDAP URI in the form of LDAP://OU=something,DC=domain,DC=suffix
        
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
    
    
        ScriptName: Get-AllADGroups.ps1
        Created By: Jeff Patton
        Date Coded: June 1, 2011
        ScriptName is used to register events for this script
        LogName is used to determine which classic log to write to
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>.\Get-AllADGroups -ADSPath "LDAP://OU=groups,DC=company,DC=com"
    
    
    GroupPath                GroupName                UserName                 DistinguishedName
    ---------                ---------                --------                 -----------------
    LDAP://CN=SoftwareAcc... SoftwareAccess           Jack Tripper             CN=Jack Tripper,CN=U
    s...
    LDAP://CN=SoftwareAcc... SoftwareAccess           Les Nessman              CN=Les Nessman,CN=Us
    e...
    LDAP://CN=Admin User ... Admin User Accounts      Ralph Monroe             CN=Ralph Monroe,CN=U
    s...
    LDAP://CN=Admin User ... Admin User Accounts      Gunther Toody            CN=Gunther Toody,CN=
    U...
    
    Description
    -----------
    Showing the basic syntax and output of the script
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    C:\PS>.\Get-AllADGroups -ADSPath "LDAP://OU=groups,DC=company,DC=com" |Export-Csv -Path .\MyGro
    ups.csv
    
    
    Description
    -----------
    This example outputs the groups and members to a csv file.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/Get-AllADGroups



```