# !Copy-GroupMembership.ps1 #
```

NAME
    C:\mod-posh\powershell\production\Copy-GroupMembership.ps1
    
SYNOPSIS
    Copy group membership between two accounts.
    
SYNTAX
    C:\mod-posh\powershell\production\Copy-GroupMembership.ps1 [-ADSPath] <Object> [-NewUser] <Obje
    ct> [[-SearchFilter] <Object>] [[-ExistingUser] <Object>] [<CommonParameters>]
    
    
DESCRIPTION
    This script will copy the group membership from an existing user
    account to a new user account.
    

PARAMETERS
    -ADSPath <Object>
        This is the LDAP URL to where your user accounts are stored
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -NewUser <Object>
        The username of the new user account
        
        Required?                    true
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -SearchFilter <Object>
        The searchFilter to pass on to AD, I'm using FSPs so it defaults
        to foreignSecurityPrincipal, but it could be Person if you're
        working with user accounts all within the same ActiveDirectory domain.
        
        Required?                    false
        Position?                    3
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -ExistingUser <Object>
        The username of the existing user account
        
        Required?                    false
        Position?                    4
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
    
    
        ScriptName : Copy-GroupMembership
        Created By : jspatton
        Date Coded : 09/22/2011 10:17:53
        ScriptName is used to register events for this script
        LogName is used to determine which classic log to write to
        
        ErrorCodes
            100 = Success
            101 = Error
            102 = Warning
            104 = Information
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>.\Copy-GroupMembership.ps1 -NewUser 'Newton' -ExistingUser 'Oldson' -ADSPath 'CN=ForeignS
    ecurityPrincipals,DC=company,DC=com'
    
    
    GroupDN                           UserDN                           Added
    -------                           ------                           -----
    LDAP://CN=IGroup,OU=Profile,OU... LDAP://CN=S-1-5-21-57989841-1... The object already exists. (
    E...
    LDAP://CN=ECSStaffProfessional... LDAP://CN=S-1-5-21-57989841-1... True
    
    Description
    -----------
    This sample shows the syntax and working against FSPs, as well as a potential error you might e
    ncounter.
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    C:\PS>.\Copy-GroupMembership.ps1 -NewUser 'Guest' -ExistingUser 'krbtgt' -ADSPath 'DC=company,D
    C=com' -SearchFilter '(objectCategory=Person)'
    
    
    GroupDN                           UserDN                                                      A
    dded
    -------                           ------                                                      -
    ----
    LDAP://CN=Denied RODC Password... LDAP://CN=Guest,CN=Users,DC=c...                             
    True
    
    Description
    -----------
    This example shows the syntax for copying group membership between accounts in the same domain.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/Copy-GroupMembership



```