## Get-ADObjects ##
```

NAME
    Get-ADObjects
    
SYNOPSIS
    Returns a list of objects from ActiveDirectory
    
SYNTAX
    Get-ADObjects [[-ADSPath] <String>] [[-SearchFilter] <String>] [[-ADProperties] <Array>] 
    [<CommonParameters>]
    
    
DESCRIPTION
    This function will return a list of objects from ActiveDirectory. It will start at the 
    provided ADSPath 
    and find each object that matches the provided SearchFilter. For each object returned only the 
    specified properties will be provided.
    

PARAMETERS
    -ADSPath <String>
        This is the LDAP URI of the location within ActiveDirectory you would like to search. This 
        can be an 
        OU, CN or even the root of your domain.
        
        Required?                    false
        Position?                    1
        Default value                (([ADSI]"").distinguishedName)
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    -SearchFilter <String>
        This parameter is specified in the same format as an LDAP Search Filter. For more 
        information on the 
        format please visit Microsoft (http://msdn.microsoft.com/en-us/library/aa746475.aspx). If 
        nothing is 
        specified on the command-line the default filter is used:
            (objectCategory=computer)
        
        Required?                    false
        Position?                    2
        Default value                (objectCategory=computer)
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    -ADProperties <Array>
        If you want specific properties returned like name, or distinguishedName 
        provide a comma seperated list.
        
        Required?                    false
        Position?                    3
        Default value                name
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer and OutVariable. For more information, see 
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        The script runs under the users context, so the user account must have permissions
        to view the objects within the domain that the function is currently running
        against.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Get-ADObjects -ADSPath "LDAP://OU=Workstations,DC=company,DC=com"
    
    
    Path                                                                  Properties               
                                                                
    ----                                                                  ----------               
                                                                
    LDAP://CN=Computer-pc01,OU=Workstations,DC=company,DC=com             {name, adspath}          
                                                                
    LDAP://CN=Computer-pc02,OU=Workstations,DC=company,DC=com             {name, adspath}          
                                                                
    LDAP://CN=Computer-pc03,OU=Workstations,DC=company,DC=com             {name, adspath}          
                                                                
    LDAP://CN=Computer-pc04,OU=Workstations,DC=company,DC=com             {name, adspath}
    
    Description
    -----------
    When specifying just the ADSPath computer objects and their associated name properties are 
    returned
    by default.
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    C:\PS>Get-ADObjects -ADSPath "LDAP://OU=Workstations,DC=company,DC=com" `
    
    
    -ADProperties "name","distinguishedName"
    
    Path                                                                  Properties               
                                                                
    ----                                                                  ----------               
                                                                
    LDAP://CN=Computer-pc01,OU=Workstations,DC=company,DC=com             {name, adspath, 
    distinguishedname}                                                   
    LDAP://CN=Computer-pc02,OU=Workstations,DC=company,DC=com             {name, adspath, 
    distinguishedname}                                                   
    LDAP://CN=Computer-pc03,OU=Workstations,DC=company,DC=com             {name, adspath, 
    distinguishedname}                                                   
    LDAP://CN=Computer-pc04,OU=Workstations,DC=company,DC=com             {name, adspath, 
    distinguishedname}
    
    Description
    -----------
    This example shows the format for ADProperties, each property is composed of a string enclosed 
    in quotes
    seperated by commas.
    
    
    
    
    
    -------------------------- EXAMPLE 3 --------------------------
    
    C:\PS>Get-ADObjects -ADSPath "LDAP://OU=Groups,DC=company,DC=com" `
    
    
    -ADProperties "name","distinguishedName" -SearchFilter group
    
    Path                                                                  Properties               
                                                                
    ----                                                                  ----------               
                                                                
    LDAP://CN=Group-01,OU=Groups,DC=Company,DC=com                        {name, adspath, 
    distinguishedname}                                                   
    LDAP://CN=Group-02,OU=Groups,DC=Company,DC=com                        {name, adspath, 
    distinguishedname}                                                   
    LDAP://CN=Group-03,OU=Groups,DC=Company,DC=com                        {name, adspath, 
    distinguishedname}                                                   
    LDAP://CN=Group-04,OU=Groups,DC=Company,DC=com                        {name, adspath, 
    distinguishedname}
    
    Description
    -----------
    This example shows multiple properties as well as setting the SearchFilter to be groups that 
    are 
    returned.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-ADObjects



```
## Add-UserToLocalGroup ##
```

NAME
    Add-UserToLocalGroup
    
SYNOPSIS
    Add a domain user to a local group.
    
SYNTAX
    Add-UserToLocalGroup [-Computer] <String> [-UserName] <String> [-LocalGroup] <String> 
    [[-UserDomain] <String>] [<CommonParameters>]
    
    
DESCRIPTION
    Add a domain user to a local group on a computer.
    

PARAMETERS
    -Computer <String>
        The NetBIOS name of the computer where the local group resides.
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    -UserName <String>
        The name of the user to add to the group.
        
        Required?                    true
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    -LocalGroup <String>
        The name of the group to add the user to.
        
        Required?                    true
        Position?                    3
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    -UserDomain <String>
        The NetBIOS name of the domain where the user object is.
        
        Required?                    false
        Position?                    4
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer and OutVariable. For more information, see 
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        The script runs under the users context, so the user account must have permissions
        to view the objects within the domain that the function is currently running
        against.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Add-UserToLocalGroup -Computer server -UserName myuser -LocalGroup administrators
    
    
    Description
    -----------
    Adds a user from the local domain to the specified computer.
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    C:\PS>Add-UserToLocalGroup -Computer server -UserName myuser -LocalGroup administrators 
    -UserDomain company
    
    
    Description
    -----------
    Adds a user from the company domain to the specified computer's local Administrators group.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Add-UserToLocalGroup



```
## Get-LocalGroupMembers ##
```

NAME
    Get-LocalGroupMembers
    
SYNOPSIS
    Return a list of user accounts that are in a specified group.
    
SYNTAX
    Get-LocalGroupMembers [-ComputerName] <String> [-GroupName] <String> [<CommonParameters>]
    
    
DESCRIPTION
    This function returns a list of accounts from the provided group. The
    object returned holds the Name, Domain and type of account that is a member,
    either a user or group.
    

PARAMETERS
    -ComputerName <String>
        The name of the computer to connect to.
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    -GroupName <String>
        The name of the group to search in.
        
        Required?                    true
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer and OutVariable. For more information, see 
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Get-LocalGroupMembers -ComputerName mypc -GroupName Administrators
    
    
    Name                              Domain                          Class
    ----                              ------                          -----
    Administrator                     mypc                            User
    My Account                        mypc                            User
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-LocalGroupMembers



```
## Get-ADGroupMembers ##
```

NAME
    Get-ADGroupMembers
    
SYNOPSIS
    Return a collection of users in an ActiveDirectory group.
    
SYNTAX
    Get-ADGroupMembers [[-UserGroup] <Object>] [[-UserDomain] <DirectoryEntry>] 
    [<CommonParameters>]
    
    
DESCRIPTION
    This function returns an object that contains all the properties of a user object. This 
    function
    works for small groups as well as groups in excess of 1000.
    

PARAMETERS
    -UserGroup <Object>
        The name of the group to get membership from.
        
        Required?                    false
        Position?                    1
        Default value                Managers
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    -UserDomain <DirectoryEntry>
        The LDAP URL of the domain that the group resides in.
        
        Required?                    false
        Position?                    2
        Default value                LDAP://DC=company,DC=com
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer and OutVariable. For more information, see 
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        The context under which this script is run must have rights to pull infromation from 
        ActiveDirectory.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Get-ADGroupMembers -UserGroup Managers |Format-Table -Property name, distinguishedName, 
    cn
    
    
    name                             distinguishedName                cn                           
       
    ----                             -----------------                --                           
       
    {Steve Roberts}                  {CN=Steve Roberts,CN=Users,DC... {Steve Roberts}              
       
    {S-1-5-21-57989841-1078081533... {CN=S-1-5-21-57989841-1078081... 
    {S-1-5-21-57989841-1078081533...
    {S-1-5-21-57989841-1078081533... {CN=S-1-5-21-57989841-1078081... 
    {S-1-5-21-57989841-1078081533...
    {Matt Temple}                    {CN=Matt Temple,CN=Users,DC=c... {Matt Temple}                
       
    ...
    Description
    -----------
    This example shows passing in a group name, but leaving the default domain name in place.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-ADGroupMembers



```
## Get-StaleComputerAccounts ##
```

NAME
    Get-StaleComputerAccounts
    
SYNOPSIS
    Return a collection of computer accounts older than a set number of days.
    
SYNTAX
    Get-StaleComputerAccounts [[-ADSPath] <String>] [[-DayOffset] <Int32>] [<CommonParameters>]
    
    
DESCRIPTION
    This function can be used to get a list of computer accounts within your Active Directory
    that are older than a certain number of days. Typically a computer account will renew it's
    own password every 90 days, so any account where the 'whenChanged' attribute is older than 
    90 would be considered old.
    

PARAMETERS
    -ADSPath <String>
        This is an LDAP url that will become the base of your search.
        
        Required?                    false
        Position?                    1
        Default value                (([ADSI]"").distinguishedName)
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    -DayOffset <Int32>
        Am integer that represents the number of days in which an account is considered stale.
        
        Required?                    false
        Position?                    2
        Default value                90
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer and OutVariable. For more information, see 
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        90 is a default value, when run in production you should use the number of days that you
        consider an account to be stale.
        The If statement that checks if adsPath contains OU=Servers is specifically for our 
        production
        environment. All "servers", regardless of OS, are placed in the Servers OU in their 
        respective 
        hierarchy. I treat server accounts slightly differently than I do workstations accounts, 
        so I 
        wanted a way to differentiate the two.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Get-StaleComputerAccounts -ADSPath "LDAP://DC=company,DC=com" -DayOffset 90
    
    
    name                             adspath                          whenchanged
    ----                             -------                          -----------
    {desktop1}                       {LDAP://CN=desktop1,OU=Sales ... {11/17/2010 9:19:01 AM}
    {workstation}                    {LDAP://CN=workstation,OU=Ser... {2/10/2011 7:05:28 PM}
    {computer09}                     {LDAP://CN=computer09,OU=Admi... {10/25/2010 3:40:32 PM}
    {workstation01}                  {LDAP://CN=workstation01,OU=S... {6/2/2010 4:29:08 PM}
    
    Description
    -----------
    This is the typical usage from the command-line as well as sample output.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-StaleComputerAccounts



```
## Set-AccountDisabled ##
```

NAME
    Set-AccountDisabled
    
SYNOPSIS
    Disable an account object in Active Directory
    
SYNTAX
    Set-AccountDisabled [-ADSPath] <String> [<CommonParameters>]
    
    
DESCRIPTION
    This function will disable an object in Active Directory, regardless of whether the object
    is a user or computer.
    

PARAMETERS
    -ADSPath <String>
        The full LDAP URI of the object to disable.
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer and OutVariable. For more information, see 
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        The context under which this function is run needs to have rights to modify the object in 
        Active Directory. The error I catch is specifically an Access is Denied message.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Set-AccountDisabled -ADSPath "LDAP://CN=Desktop-01,OU=Workstations,DC=Company,DC=com"
    
    
    
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Set-AccountDisabled



```
## Reset-ComputerAccount ##
```

NAME
    Reset-ComputerAccount
    
SYNOPSIS
    Reset computer account password
    
SYNTAX
    Reset-ComputerAccount [-ADSPath] <String> [<CommonParameters>]
    
    
DESCRIPTION
    This function will reset the computer account password for a single computer
    or for an OU of computers.
    

PARAMETERS
    -ADSPath <String>
        The ADSPath of the computer account, or containing OU.
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer and OutVariable. For more information, see 
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Reset-ComputerAccount -ADSPath "LDAP://CN=Desktop-PC01,OU=Workstations,DC=company,DC=com"
    
    
    Description
    -----------
    Example usage showing single computer account reset.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Reset-ComputerAccount



```
## Add-DomainGroupToLocalGroup ##
```

NAME
    Add-DomainGroupToLocalGroup
    
SYNOPSIS
    Add a Domain security group to a local computer group
    
SYNTAX
    Add-DomainGroupToLocalGroup [-ComputerName] <String> [-DomainGroup] <String> [[-LocalGroup] 
    <String>] [[-UserDomain] <String>] [<CommonParameters>]
    
    
DESCRIPTION
    This function will add a Domain security group to a local computer group.
    

PARAMETERS
    -ComputerName <String>
        The NetBIOS name of the computer to update
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    -DomainGroup <String>
        The name of the Domain security group
        
        Required?                    true
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    -LocalGroup <String>
        The name of the local group to update, if not provided Administrators is assumed.
        
        Required?                    false
        Position?                    3
        Default value                Administrators
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    -UserDomain <String>
        The NetBIOS domain name.
        
        Required?                    false
        Position?                    4
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer and OutVariable. For more information, see 
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Add-DomainGroupToLocalGroup -ComputerName "Desktop-PC01" -DomainGroup "StudentAdmins" 
    -UserDomain "COMPANY"
    
    
    Description
    ===========
    Showing the default syntax to add a student admin group to a local computer account.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Add-DomainGroupToLocalGroup



```
## Get-FSMORoleOwner ##
```

NAME
    Get-FSMORoleOwner
    
SYNOPSIS
    Retrieves the list of FSMO role owners of a forest and domain
    
SYNTAX
    Get-FSMORoleOwner [<CommonParameters>]
    
    
DESCRIPTION
    Retrieves the list of FSMO role owners of a forest and domain
    

PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer and OutVariable. For more information, see 
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        Name: Get-FSMORoleOwner
        Author: Boe Prox
        DateCreated: 06/9/2011
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Get-FSMORoleOwner
    
    
    DomainNamingMaster  : dc1.rivendell.com
    Domain              : rivendell.com
    RIDOwner            : dc1.rivendell.com
    Forest              : rivendell.com
    InfrastructureOwner : dc1.rivendell.com
    SchemaMaster        : dc1.rivendell.com
    PDCOwner            : dc1.rivendell.com
    
    Description
    -----------
    Retrieves the FSMO role owners each domain in a forest. Also lists the domain and forest.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-FSMORoleOwner



```
## Convert-FspToUsername ##
```

NAME
    Convert-FspToUsername
    
SYNOPSIS
    Convert a FSP to a sAMAccountName
    
SYNTAX
    Convert-FspToUsername [-UserSID] <Object> [<CommonParameters>]
    
    
DESCRIPTION
    This function converts FSP's to sAMAccountName's.
    

PARAMETERS
    -UserSID <Object>
        This is the SID of the FSP in the form of S-1-5-20. These can be found
        in the ForeignSecurityPrincipals container of your domain.
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue)
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer and OutVariable. For more information, see 
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        This function currently expects a SID in the same format as you see being displayed
        as the name property of each object in the ForeignSecurityPrincipals container in your
        domain.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Convert-FspToUsername -UserSID "S-1-5-11","S-1-5-17","S-1-5-20"
    
    
    sAMAccountName                      Sid
    --------------                      ---
    NT AUTHORITY\Authenticated Users    S-1-5-11
    NT AUTHORITY\IUSR                   S-1-5-17
    NT AUTHORITY\NETWORK SERVICE        S-1-5-20
    
    Description
    ===========
    This example shows passing in multipe sids to the function
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    C:\PS>Get-ADObjects -ADSPath "LDAP://CN=ForeignSecurityPrincipals,DC=company,DC=com" 
    -SearchFilter "(objectClass=foreignSecurityPrincipal)" |
    
    
    foreach {$_.Properties.name} |Convert-FspToUsername
    
    sAMAccountName                      Sid
    --------------                      ---
    NT AUTHORITY\Authenticated Users    S-1-5-11
    NT AUTHORITY\IUSR                   S-1-5-17
    NT AUTHORITY\NETWORK SERVICE        S-1-5-20
    
    Description
    ===========
    This example takes the output of the Get-ADObjects function, and pipes it through foreach to 
    get to the name
    property, and the resulting output is piped through Convert-FspToUsername.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Convert-FspToUsername



```
## Set-ComputerName ##
```

NAME
    Set-ComputerName
    
SYNOPSIS
    Change the name of the computer
    
SYNTAX
    Set-ComputerName [[-NewName] <String>] [[-ComputerName] <String>] [[-Credentials] <Object>] 
    [[-Reboot] <Boolean>] [<CommonParameters>]
    
    
DESCRIPTION
    This function will rename the local or optionally remote computer to the
    computername of your choice. In addition you can force the computer to
    reboot to finish the change.
    

PARAMETERS
    -NewName <String>
        The new 15 character NetBIOS for the computer
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    -ComputerName <String>
        The NetBIOS name of the computer
        
        Required?                    false
        Position?                    2
        Default value                (hostname)
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    -Credentials <Object>
        Provide administrator credentials
        
        Required?                    false
        Position?                    3
        Default value                (Get-Credential)
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    -Reboot <Boolean>
        True to reboot
        
        Required?                    false
        Position?                    4
        Default value                False
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer and OutVariable. For more information, see 
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        FunctionName : Set-ComputerName
        Created by   : Jeff Patton
        Date Coded   : 09/21/2011 10:59:03
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Set-ComputerName -NewName 'Desktop-PC02' -ComputerName 'Desktop-PC01' -Reboot $True
    
    
    OldName : Desktop-PC01
    NewName : Desktop-PC02
    Reboot  : 0
    Success : 0
    
    Description
    -----------
    This example shows the basic usage on a local computer. The 0 indicates success, so
    the computer rebooted, and the name changed.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Set-ComputerName



```
## Get-DomainName ##
```

NAME
    Get-DomainName
    
SYNOPSIS
    Get the FQDN of the domain from an LDAP Url
    
SYNTAX
    Get-DomainName [[-LdapUrl] <Object>] [<CommonParameters>]
    
    
DESCRIPTION
    This function returns the FQDN of a domain based on the LDAP Url.
    

PARAMETERS
    -LdapUrl <Object>
        The LDAP URL for whatever object you need the FQDN for.
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer and OutVariable. For more information, see 
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        FunctionName : Get-DomainName
        Created by   : Jeff Patton
        Date Coded   : 09/22/2011 09:42:38
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Get-DomainName -LdapUrl 'LDAP://CN=UserAccount,OU=Employees,DC=company,DC=com'
    
    
    LdapUrl    : LDAP://CN=UserAccount,OU=Employees,DC=company,DC=com
    DomainName : company.com
    
    Description
    -----------
    This example shows the basic syntax of the commnand.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-DomainName



```
## Get-UserGroupMembership ##
```

NAME
    Get-UserGroupMembership
    
SYNOPSIS
    Get a list of groups as displayed on the user objects Member of tab
    
SYNTAX
    Get-UserGroupMembership [-UserDN] <Object> [<CommonParameters>]
    
    
DESCRIPTION
    This function returns a listing of groups that the user is a direct
    member of. This is the same list that should appear in the Member Of
    tab in Active Directory Users and Computers.
    

PARAMETERS
    -UserDN <Object>
        The DistinguishedName of the user object
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer and OutVariable. For more information, see 
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        FunctionName : Get-UserGroupMembership
        Created by   : Jeff Patton
        Date Coded   : 09/22/2011 12:53:23
        
        This script runs in the context of the user and as such the user
        will need to have the requisite permissions to view the group membership
        of a given user object.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Get-UserGroupMembership -UserDN "CN=useraccount,OU=employees,DC=company,DC=com"
    
    
    GroupDN
    -------
    CN=AdminStaff,OU=Groups,DC=company,DC=com
    CN=ServerAdmin,OU=Groups,DC=Company,DC=com
    
    Description
    -----------
    This shows the basic syntax of a user in the local domain.
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    C:\PS>Get-UserGroupMembership -UserDN 
    "CN=S-1-5-17,CN=ForeignSecurityPrincipals,DC=company,DC=com"
    
    
    GroupDN
    -------
    CN=IIS_IUSRS,CN=Builtin,DC=company,DC=com
    
    Description
    -----------
    This function also works against FSP's in your domain.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-UserGroupMembership



```
## Add-UserToGroup ##
```

NAME
    Add-UserToGroup
    
SYNOPSIS
    Add a domain user to a domain group
    
SYNTAX
    Add-UserToGroup [[-GroupDN] <Object>] [[-UserDN] <Object>] [<CommonParameters>]
    
    
DESCRIPTION
    This function adds a domain user account to a domain group.
    

PARAMETERS
    -GroupDN <Object>
        The distinguishedName of the group to add to
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    -UserDN <Object>
        The distinguishedName of the user account to add
        
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer and OutVariable. For more information, see 
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        FunctionName : Add-UserToGroup
        Created by   : Jeff Patton
        Date Coded   : 09/22/2011 14:18:33
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Add-UserToGroup -GroupDN 'CN=AdminStaff,OU=Groups,DC=company,DC=com' -UserDN 
    'CN=UserAccount,OU=Employees,DC=company,DC=com'
    
    
    GroupDN : LDAP://CN=AdminStaff,OU=Groups,DC=company,DC=com
    UserDN  : LDAP://CN=UserAccount,OU=Employees,DC=company,DC=com
    Added   : True
    
    Description
    -----------
    This example shows the syntax of the command.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Add-UserToGroup



```
## Set-ADObjectProperties ##
```

NAME
    Set-ADObjectProperties
    
SYNOPSIS
    Set the properties of a given object in AD
    
SYNTAX
    Set-ADObjectProperties [[-ADObject] <Object>] [[-PropertyPairs] <Object>] [<CommonParameters>]
    
    
DESCRIPTION
    This function will set the properties of a given object in AD. The
    function takes a comma seperated Propertyname, PropertyValue and sets
    the value of that property on the object.
    

PARAMETERS
    -ADObject <Object>
        The object within AD to be modified
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    -PropertyPairs <Object>
        The PropertyName and PropertyValue to be set. This can be an array
        of values as such:
            "Description,UserAccount","Office,Building 1"
        The PropertyName should always be listed first, followed by the
        values of the property.
        
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer and OutVariable. For more information, see 
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        FunctionName : Set-ADObjectProperties
        Created by   : Jeff Patton
        Date Coded   : 09/23/2011 14:27:19
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Set-ADObjectProperties -ADObject 'LDAP://CN=UserAccount,CN=Users,DC=company,DC=com' 
    -PropertyPairs "Description,New User Account"
    
    
    Description
    -----------
    This is the basic syntax of this function.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Set-ADObjectProperties



```
## Get-GPO ##
```

NAME
    Get-GPO
    
SYNOPSIS
    Return a list of all GPO's in a domain.
    
SYNTAX
    Get-GPO [[-Domain] <String>] [<CommonParameters>]
    
    
DESCRIPTION
    This function returns a list of all GPO's in the specified domain.
    

PARAMETERS
    -Domain <String>
        The FQDN of the domain to search
        
        Required?                    false
        Position?                    1
        Default value                $env:userDNSdomain
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer and OutVariable. For more information, see 
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        FunctionName : Get-GPO
        Created by   : Jeff Patton
        Date Coded   : 03/13/2012 18:37:08
        
        You will need the Group Policy Managment console or RSAT installed.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Get-GPO
    
    
    DisplayName                 : Default Domain Policy
    Path                        : 
    cn={31B2F340-016D-11D2-945F-00C04FB984F9},cn=policies,cn=system,DC=COMPANY,DC=COM
    ID                          : {31B2F340-016D-11D2-945F-00C04FB984F9}
    DomainName                  : COMPANY.COM
    CreationTime                : 9/1/2004 10:49:52 AM
    ModificationTime            : 6/14/2011 10:21:20 AM
    UserDSVersionNumber         : 33
    ComputerDSVersionNumber     : 255
    UserSysvolVersionNumber     : 33
    ComputerSysvolVersionNumber : 255
    Description                 :
    
    Description
    -----------
    This example shows the basic syntax of the command.
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    C:\PS>Get-GPO -Domain COMPANY.NET
    
    
    DisplayName                 : Default Domain Policy
    Path                        : 
    cn={31B2F340-016D-11D2-945F-00C04FB984F9},cn=policies,cn=system,DC=COMPANY,DC=NET
    ID                          : {31B2F340-016D-11D2-945F-00C04FB984F9}
    DomainName                  : COMPANY.NET
    CreationTime                : 9/1/2004 10:49:52 AM
    ModificationTime            : 6/14/2011 10:21:20 AM
    UserDSVersionNumber         : 33
    ComputerDSVersionNumber     : 255
    UserSysvolVersionNumber     : 33
    ComputerSysvolVersionNumber : 255
    Description                 :
    
    Description
    -----------
    This example shows using the domain parameter to specify an alternate domain.
    
    
    
    
    
    
RELATED LINKS
     http://scripts.patton-tech.com/wiki/PowerShell/ActiveDirectoryManagement#Get-GPO
     http://blogs.technet.com/b/grouppolicy/archive/2011/06/10/listing-all-gpos-in-the-current-fore
    st.aspx
     http://www.microsoft.com/download/en/search.aspx?q=gpmc
     http://www.microsoft.com/download/en/search.aspx?q=remote%20server%20administration%20tools



```
## Get-UnlinkedGPO ##
```

NAME
    Get-UnlinkedGPO
    
SYNOPSIS
    Return a list of unlinked Group Policy Objects
    
SYNTAX
    Get-UnlinkedGPO [[-Domain] <String>] [<CommonParameters>]
    
    
DESCRIPTION
    This function will return a list of unlinked Group Policy Objects from
    the specified domain.
    

PARAMETERS
    -Domain <String>
        The FQDN of the domain to search
        
        Required?                    false
        Position?                    1
        Default value                $env:userDNSdomain
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer and OutVariable. For more information, see 
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        FunctionName : Get-UnlinkedGPO
        Created by   : Jeff Patton
        Date Coded   : 03/13/2012 18:54:38
        
        You will need the Group Policy Management Console or RSAT installed
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Get-UnlinkedGPO
    
    
    DisplayName                 : No Offline Files GPO
    Path                        : 
    cn={7BE5802A-3A76-411E-B685-C2DE9A8DE8B9},cn=policies,cn=system,DC=COMPANY,DC=COM
    ID                          : {7BE5802A-3A76-411E-B685-C2DE9A8DE8B9}
    DomainName                  : COMPANY.COM
    CreationTime                : 11/2/2005 11:06:34 AM
    ModificationTime            : 6/14/2011 10:21:38 AM
    UserDSVersionNumber         : 0
    ComputerDSVersionNumber     : 14
    UserSysvolVersionNumber     : 0
    ComputerSysvolVersionNumber : 14
    Description                 :
    
    Description
    -----------
    This shows the basic syntax of the command.
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    C:\PS>Get-UnlinkedGPO -Domain COMPANY.NET
    
    
    DisplayName                 : PartialPath
    Path                        : 
    cn={D074F8A6-CA41-464F-96A6-9155C96B486B},cn=policies,cn=system,DC=COMPANY,DC=NET
    ID                          : {D074F8A6-CA41-464F-96A6-9155C96B486B}
    DomainName                  : COMPANY.NET
    CreationTime                : 1/11/2010 11:11:14 AM
    ModificationTime            : 6/14/2011 10:21:40 AM
    UserDSVersionNumber         : 0
    ComputerDSVersionNumber     : 4
    UserSysvolVersionNumber     : 0
    ComputerSysvolVersionNumber : 4
    Description                 :
    
    Description
    -----------
    This example shows using the domain parameter to specify an alternate domain.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-UnlinkedGPO
     http://blogs.technet.com/b/heyscriptingguy/archive/2009/02/10/how-can-get-a-list-of-all-my-orp
    haned-group-policy-objects.aspx
     http://www.microsoft.com/download/en/search.aspx?q=gpmc
     http://www.microsoft.com/download/en/search.aspx?q=remote%20server%20administration%20tools



```