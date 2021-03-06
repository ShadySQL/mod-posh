Function Get-ADObjects
{
    <#
        .SYNOPSIS
            Returns a list of objects from ActiveDirectory
        .DESCRIPTION
            This function will return a list of objects from ActiveDirectory. It will start at the provided ADSPath 
            and find each object that matches the provided SearchFilter. For each object returned only the 
            specified properties will be provided.
        .PARAMETER ADSPath
            This is the LDAP URI of the location within ActiveDirectory you would like to search. This can be an 
            OU, CN or even the root of your domain.
        .PARAMETER SearchFilter
            This parameter is specified in the same format as an LDAP Search Filter. For more information on the 
            format please visit Microsoft (http://msdn.microsoft.com/en-us/library/aa746475.aspx). If nothing is 
            specified on the command-line the default filter is used:
                (objectCategory=computer)
        .PARAMETER ADProperties
            If you want specific properties returned like name, or distinguishedName 
            provide a comma seperated list.
        .EXAMPLE
            Get-ADObjects -ADSPath "LDAP://OU=Workstations,DC=company,DC=com"

            Path                                                                  Properties                                                                           
            ----                                                                  ----------                                                                           
            LDAP://CN=Computer-pc01,OU=Workstations,DC=company,DC=com             {name, adspath}                                                                      
            LDAP://CN=Computer-pc02,OU=Workstations,DC=company,DC=com             {name, adspath}                                                                      
            LDAP://CN=Computer-pc03,OU=Workstations,DC=company,DC=com             {name, adspath}                                                                      
            LDAP://CN=Computer-pc04,OU=Workstations,DC=company,DC=com             {name, adspath}
            
            Description
            -----------
            When specifying just the ADSPath computer objects and their associated name properties are returned
            by default.
        .EXAMPLE
            Get-ADObjects -ADSPath "LDAP://OU=Workstations,DC=company,DC=com" `
            -ADProperties "name","distinguishedName"

            Path                                                                  Properties                                                                           
            ----                                                                  ----------                                                                           
            LDAP://CN=Computer-pc01,OU=Workstations,DC=company,DC=com             {name, adspath, distinguishedname}                                                   
            LDAP://CN=Computer-pc02,OU=Workstations,DC=company,DC=com             {name, adspath, distinguishedname}                                                   
            LDAP://CN=Computer-pc03,OU=Workstations,DC=company,DC=com             {name, adspath, distinguishedname}                                                   
            LDAP://CN=Computer-pc04,OU=Workstations,DC=company,DC=com             {name, adspath, distinguishedname}

            Description
            -----------
            This example shows the format for ADProperties, each property is composed of a string enclosed in quotes
            seperated by commas.
        .EXAMPLE
            Get-ADObjects -ADSPath "LDAP://OU=Groups,DC=company,DC=com" `
            -ADProperties "name","distinguishedName" -SearchFilter group

            Path                                                                  Properties                                                                           
            ----                                                                  ----------                                                                           
            LDAP://CN=Group-01,OU=Groups,DC=Company,DC=com                        {name, adspath, distinguishedname}                                                   
            LDAP://CN=Group-02,OU=Groups,DC=Company,DC=com                        {name, adspath, distinguishedname}                                                   
            LDAP://CN=Group-03,OU=Groups,DC=Company,DC=com                        {name, adspath, distinguishedname}                                                   
            LDAP://CN=Group-04,OU=Groups,DC=Company,DC=com                        {name, adspath, distinguishedname}
            
            Description
            -----------
            This example shows multiple properties as well as setting the SearchFilter to be groups that are 
            returned.
        .NOTES
            The script runs under the users context, so the user account must have permissions
            to view the objects within the domain that the function is currently running
            against.
        .LINK
            https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-ADObjects
    #>
    [CmdletBinding()]
    Param
        (
        [string]$ADSPath = (([ADSI]"").distinguishedName),
        [string]$SearchFilter = "(objectCategory=computer)",
        [array]$ADProperties="name"
        )
    Begin
    {
        if ($ADSPath -notmatch "LDAP://*")
        {
            $ADSPath = "LDAP://$($ADSPath)"
            }
        }
    Process
    {
        Try
        {
            $DirectoryEntry = New-Object System.DirectoryServices.DirectoryEntry($ADSPath)
            $DirectorySearcher = New-Object System.DirectoryServices.DirectorySearcher
            $DirectorySearcher.SearchRoot = $DirectoryEntry
            $DirectorySearcher.PageSize = 1000
            $DirectorySearcher.Filter = $SearchFilter
            $DirectorySearcher.SearchScope = "Subtree"

            foreach ($Property in $ADProperties)
                {
                    [void]$DirectorySearcher.PropertiesToLoad.Add($Property)
                    }

            $ADObjects = @()
            foreach ($ADObject in $DirectorySearcher.FindAll())
            {
                $objResult = New-Object -TypeName PSObject
                foreach ($ADProperty in $ADProperties)
                {
                    Add-Member -InputObject $objResult -MemberType NoteProperty -Name $ADProperty -Value $ADObject.Properties.($ADProperty.ToLower())
                    }
                Add-Member -InputObject $objResult -MemberType NoteProperty -Name 'adsPath' -Value $ADObject.Properties.adspath
                $ADObjects += $objResult
                }
            }
        Catch
        {
            Return $Error[0].Exception
            }
        }
    End
    {
        Return $ADObjects
        }
    }
Function Get-StaleComputerAccounts
{
    <#
        .SYNOPSIS
            Return a collection of computer accounts older than a set number of days.
        .DESCRIPTION
            This function can be used to get a list of computer accounts within your Active Directory
            that are older than a certain number of days. Typically a computer account will renew it's
            own password every 90 days, so any account where the 'whenChanged' attribute is older than 
            90 would be considered old.
        .PARAMETER ADSPath
            This is an LDAP url that will become the base of your search.
        .PARAMETER DayOffset
            Am integer that represents the number of days in which an account is considered stale.
        .EXAMPLE
            Get-StaleComputerAccounts -ADSPath "LDAP://DC=company,DC=com" -DayOffset 90

            name                             adspath                          whenchanged
            ----                             -------                          -----------
            {desktop1}                       {LDAP://CN=desktop1,OU=Sales ... {11/17/2010 9:19:01 AM}
            {workstation}                    {LDAP://CN=workstation,OU=Ser... {2/10/2011 7:05:28 PM}
            {computer09}                     {LDAP://CN=computer09,OU=Admi... {10/25/2010 3:40:32 PM}
            {workstation01}                  {LDAP://CN=workstation01,OU=S... {6/2/2010 4:29:08 PM}

            Description
            -----------
            This is the typical usage from the command-line as well as sample output.
        .NOTES
            90 is a default value, when run in production you should use the number of days that you
            consider an account to be stale.
            The If statement that checks if adsPath contains OU=Servers is specifically for our production
            environment. All "servers", regardless of OS, are placed in the Servers OU in their respective 
            hierarchy. I treat server accounts slightly differently than I do workstations accounts, so I 
            wanted a way to differentiate the two.
        .LINK
            https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-StaleComputerAccounts
    #>
    [CmdletBinding()]    
    Param
        (
        [string]$ADSPath = (([ADSI]"").distinguishedName),
        [int]$DayOffset = 90
        )
    Begin
    {
        if ($ADSPath -notmatch "LDAP://*")
        {
            $ADSPath = "LDAP://$($ADSPath)"
            }
            
        $DateOffset = (Get-Date).AddDays(-$DayOffset)
        [string]$SearchFilter = "(objectCategory=computer)"
        [array]$ADProperties= "name", "whenChanged", "whenCreated"

        $DirectoryEntry = New-Object System.DirectoryServices.DirectoryEntry($ADSPath)
        $DirectorySearcher = New-Object System.DirectoryServices.DirectorySearcher
        $DirectorySearcher.SearchRoot = $DirectoryEntry
        $DirectorySearcher.PageSize = 1000
        $DirectorySearcher.Filter = $SearchFilter
        $DirectorySearcher.SearchScope = "Subtree"

        foreach ($Property in $ADProperties)
            {
                [void]$DirectorySearcher.PropertiesToLoad.Add($Property)
                }

        $ADObjects = $DirectorySearcher.FindAll()
        }
    Process
    {
        $StaleComputerAccounts = @()

        foreach ($ADObject in $ADObjects)
        {
            $WhenChanged = $ADObject.Properties.whenchanged
            $WhenCreated = $ADObject.Properties.whencreated
            if ($WhenChanged -lt $DateOffset -and $ADObject.Properties.adspath -notlike "*OU=Servers*")
            {
                $ThisComputer = New-Object PSObject -Property @{
                    name = [string]$ADObject.Properties.name
                    adspath = [string]$ADObject.Properties.adspath
                    whenchanged = [string]$WhenChanged
                    whencreated = [string]$WhenCreated
                    }
                $StaleComputerAccounts += $ThisComputer
                }
            }
        }    
    End
    {
        Return $StaleComputerAccounts
        }
    }
Function Get-FSMORoleOwner 
{
    <#  
        .SYNOPSIS  
            Retrieves the list of FSMO role owners of a forest and domain  
        .DESCRIPTION  
            Retrieves the list of FSMO role owners of a forest and domain
        .PARMETER TargetDomain
            The FQDN of the domain to query on
        .NOTES  
            Name: Get-FSMORoleOwner
            Author: Boe Prox
            DateCreated: 06/9/2011  
        .EXAMPLE
            Get-FSMORoleOwner

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
        .LINK
            https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-FSMORoleOwner
    #>
    [CmdletBinding()]
    Param
        (
        [string]$TargetDomain = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain().Name
        )
    Begin
    {
        $ForestContext = New-Object System.DirectoryServices.ActiveDirectory.DirectoryContext("Forest",$TargetDomain)
        $Forest = [system.directoryservices.activedirectory.Forest]::GetForest($ForestContext)
        }
    Process
    {
        Try 
        {
            ForEach ($domain in $forest.domains) 
            {
                $forestproperties = @{
                    Forest = $Forest.name
                    Domain = $domain.name
                    SchemaMaster = $forest.SchemaRoleOwner
                    DomainNamingMaster = $forest.NamingRoleOwner
                    RIDOwner = $Domain.RidRoleOwner
                    PDCOwner = $Domain.PdcRoleOwner
                    InfrastructureOwner = $Domain.InfrastructureRoleOwner
                    }
                $ForestObject = New-Object PSObject -Property $forestproperties
                $ForestObject.PSTypeNames.Insert(0,"ForestRoles")
                }
            }
        Catch 
        {
            Return $Error[0].Exception.InnerException.Message.ToString().Trim()
            }
        }
    End
    {
        Return $ForestObject
        }
    }
Function Get-GPO
{
    <#
        .SYNOPSIS
            Return a list of all GPO's in a domain.
        .DESCRIPTION
            This function returns a list of all GPO's in the specified domain.
        .PARAMETER Domain
            The FQDN of the domain to search
        .EXAMPLE
            Get-GPO

            DisplayName                 : Default Domain Policy
            Path                        : cn={31B2F340-016D-11D2-945F-00C04FB984F9},cn=policies,cn=system,DC=COMPANY,DC=COM
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
        .EXAMPLE
            Get-GPO -Domain COMPANY.NET

            DisplayName                 : Default Domain Policy
            Path                        : cn={31B2F340-016D-11D2-945F-00C04FB984F9},cn=policies,cn=system,DC=COMPANY,DC=NET
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
        .NOTES
            FunctionName : Get-GPO
            Created by   : Jeff Patton
            Date Coded   : 03/13/2012 18:37:08

            You will need the Group Policy Managment console or RSAT installed.
        .LINK
            http://scripts.patton-tech.com/wiki/PowerShell/ActiveDirectoryManagement#Get-GPO
        .LINK
            http://blogs.technet.com/b/grouppolicy/archive/2011/06/10/listing-all-gpos-in-the-current-forest.aspx
        .LINK
            http://www.microsoft.com/download/en/search.aspx?q=gpmc
        .LINK
            http://www.microsoft.com/download/en/search.aspx?q=remote%20server%20administration%20tools
    #>
    [CmdletBinding()]
    Param
        (
        [string]$Domain = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain().Name
        )
    Begin
    {
        Try
        {
            Write-Verbose "Instantiating GroupPolicy Management API"
            $GpoMgmt = New-Object -ComObject gpmgmt.gpm
            }
        catch
        {
            Return $Error[0].Exception.InnerException.Message.ToString().Trim()
            }
        }
    Process
    {
        try
        {
            $GpoConstants = $GpoMgmt.GetConstants()
            $GpoDomain = $GpoMgmt.GetDomain($Domain,$null,$GpoConstants.UseAnyDC)
            $GpoSearchCriteria = $GpoMgmt.CreateSearchCriteria()
            $GroupPolicyObjects = $GpoDomain.SearchGPOs($GpoSearchCriteria)
            }
        catch
        {
            Return $Error[0].Exception.InnerException.Message.ToString().Trim()
            }
        }
    End
    {
        Return $GroupPolicyObjects
        }
    }
Function Get-UnlinkedGPO
 {
    <#
        .SYNOPSIS
            Return a list of unlinked Group Policy Objects
        .DESCRIPTION
            This function will return a list of unlinked Group Policy Objects from
            the specified domain.
        .PARAMETER Domain
            The FQDN of the domain to search
        .EXAMPLE
            Get-UnlinkedGPO

            DisplayName                 : No Offline Files GPO
            Path                        : cn={7BE5802A-3A76-411E-B685-C2DE9A8DE8B9},cn=policies,cn=system,DC=COMPANY,DC=COM
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
        .EXAMPLE
            Get-UnlinkedGPO -Domain COMPANY.NET

            DisplayName                 : PartialPath
            Path                        : cn={D074F8A6-CA41-464F-96A6-9155C96B486B},cn=policies,cn=system,DC=COMPANY,DC=NET
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
        .NOTES
            FunctionName : Get-UnlinkedGPO
            Created by   : Jeff Patton
            Date Coded   : 03/13/2012 18:54:38

            You will need the Group Policy Management Console or RSAT installed
        .LINK
            https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-UnlinkedGPO
        .LINK
            http://blogs.technet.com/b/heyscriptingguy/archive/2009/02/10/how-can-get-a-list-of-all-my-orphaned-group-policy-objects.aspx
        .LINK
            http://www.microsoft.com/download/en/search.aspx?q=gpmc
        .LINK
            http://www.microsoft.com/download/en/search.aspx?q=remote%20server%20administration%20tools
    #>
    [CmdletBinding()]
    Param
        (
        [string]$Domain = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain().Name
        )
    Begin
    {
        Try
        {
            Write-Verbose "Instantiating GroupPolicy Management API"
            $GpoMgmt = New-Object -ComObject gpmgmt.gpm
            }
        catch
        {
            Return $Error[0].Exception.InnerException.Message.ToString().Trim()
            }
        
        $unlinkedGPO = @()
        }
    Process
    {
        try
        {
            $GpoConstants = $GpoMgmt.GetConstants()
            $GpoDomain = $GpoMgmt.GetDomain($Domain,$null,$GpoConstants.UseAnyDC)
            $GpoSearchCriteria = $GpoMgmt.CreateSearchCriteria()
            $GroupPolicyObjects = $GpoDomain.SearchGPOs($GpoSearchCriteria)

            foreach ($GroupPolicyObject in $GroupPolicyObjects)
            {
                $GpoSearchCriteria = $GpoMgmt.CreateSearchCriteria()
                $GpoSearchCriteria.Add($GpoConstants.SearchPropertySomLinks, $GpoConstants.SearchOpContains, $GroupPolicyObject)
                $GpoSomLinks = $GpoDomain.SearchSoms($GpoSearchCriteria)
                if ($GpoSomLinks.Count -eq 0)
                {
                    $unlinkedGPO += $GroupPolicyObject
                    }
                }
            }
        catch
        {
            Return $Error[0].Exception.InnerException.Message.ToString().Trim()
            }
        }
    End
    {
        Return $unlinkedGPO
        }
    }
Function Get-ADGroupMembers
{
    <#
        .SYNOPSIS
            Return a collection of users in an ActiveDirectory group.
        .DESCRIPTION
            This function returns an object that contains all the properties of a user object. This function
            works for small groups as well as groups in excess of 1000.
        .PARAMETER UserGroup
            The name of the group to get membership from.
        .PARAMETER ADSPath
            The LDAP URL of the domain that the group resides in.
        .EXAMPLE
            Get-ADGroupMembers -UserGroup Managers |Format-Table -Property name, distinguishedName, cn

            name                             distinguishedName                cn                              
            ----                             -----------------                --                              
            {Steve Roberts}                  {CN=Steve Roberts,CN=Users,DC... {Steve Roberts}                 
            {S-1-5-21-57989841-1078081533... {CN=S-1-5-21-57989841-1078081... {S-1-5-21-57989841-1078081533...
            {S-1-5-21-57989841-1078081533... {CN=S-1-5-21-57989841-1078081... {S-1-5-21-57989841-1078081533...
            {Matt Temple}                    {CN=Matt Temple,CN=Users,DC=c... {Matt Temple}                   
            ...
            Description
            -----------
            This example shows passing in a group name, but leaving the default domain name in place.
        .NOTES
            The context under which this script is run must have rights to pull infromation from ActiveDirectory.
        .LINK
            https://code.google.com/p/mod-posh/wiki/ActiveDirectoryManagement#Get-ADGroupMembers
    #>
    [CmdletBinding()]
    Param
        (
        [string]$UserGroup = "Managers",
        [string]$ADSPath = (([ADSI]"").distinguishedName)
        )
    Begin
    {
        if ($ADSPath -notmatch "LDAP://*")
        {
            $ADSPath = "LDAP://$($ADSPath)"
            }

        $DirectoryEntry = New-Object System.DirectoryServices.DirectoryEntry($ADSPath)
        $DirectorySearcher = New-Object System.DirectoryServices.DirectorySearcher

        $LDAPFilter = "(&(objectCategory=Group)(name=$($UserGroup)))"

        $DirectorySearcher.SearchRoot = $DirectoryEntry
        $DirectorySearcher.PageSize = 1000
        $DirectorySearcher.Filter = $LDAPFilter
        $DirectorySearcher.SearchScope = "Subtree"

        $SearchResult = $DirectorySearcher.FindAll()
            
        $UserAccounts = @()
        }
    Process
    {
        foreach ($Item in $SearchResult)
        {
            $Group = $Item.GetDirectoryEntry()
            $Members = $Group.member
                
            If ($Members -ne $Null)
            {
                foreach ($User in $Members)
                {
                    $UserObject = New-Object System.DirectoryServices.DirectoryEntry("LDAP://$($User)")
                    If ($UserObject.objectCategory.Value.Contains("Group"))
                    {
                        }
                    Else
                    {
                        $ThisUser = New-Object -TypeName PSObject -Property @{
                            cn = [string]$UserObject.cn
                            distinguishedName = [string]$UserObject.distinguishedName
                            name = [string]$UserObject.name
                            nTSecurityDescriptor = $UserObject.nTSecurityDescriptor
                            objectCategory = [string]$UserObject.objectCategory
                            objectClass = $UserObject.objectClass
                            objectGUID = $UserObject.objectGUID
                            objectSID = $UserObject.objectSID
                            showInAdvancedViewOnly = $UserObject.showInAdvancedViewOnly
                            }
                        }
                    $UserAccounts += $ThisUser
                    }
                }
            }
        }
    End
    {
        Return $UserAccounts
        }
    }