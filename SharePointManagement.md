## New-Sharepoint3Site ##
```

NAME
    New-Sharepoint3Site
    
SYNOPSIS
    Creates a new WSS 3.0 site inside a new SQL database
    
SYNTAX
    New-Sharepoint3Site [[-sitetemplate] <String>] [-url] <String> [-ownerlogin] <String> [-ownerem
    ail] <String> [-title] <String> [-databasename] <String> [<CommonParameters>]
    
    
DESCRIPTION
    This function creats a new WSS 3.0 site inside a newly created
    database.
    

PARAMETERS
    -sitetemplate <String>
        This parameter has a default setting of STS#0 which is the basic 
        team template. You can specify previously installed themes or
        additional pre-built themes on the site. 
        Here is the list of built-in themes:
            http://technet.microsoft.com/en-us/library/cc262594(office.12).aspx
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -url <String>
        This is the FQDN of your sharepoint installation.
        
        Required?                    true
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -ownerlogin <String>
        This parameter needs the Domain credentials of the user who will
        own this site intially.
        
        Required?                    true
        Position?                    3
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -owneremail <String>
        This is the email address that corresponds to the ownerlogin parameter.
        
        Required?                    true
        Position?                    4
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -title <String>
        This will be the title of the site that will be displayed in
        the browser title bar.
        
        Required?                    true
        Position?                    5
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -databasename <String>
        This parameter is the name of the database you wish to hold the
        new site. If you have a database name policy you should follow
        that here.
        
        Required?                    true
        Position?                    6
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
    
    
        You will need to be running this under the Sharepoint Farm administrators context.
        This script will need to run on the server that is hosting the SharePoint admin site.
        The STSADM command needs to be on your path, or run the script from inside the folder
        where STSADM is located.
        You will need to have a managed path setup in advance.
        If the site already exists the script will error out.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>New-Sharepoint3Site -url https://intranet.company.com/team -ownerlogin administrator `
    
    
    -owneremail administrator@company.com -title "Company Team Site" -databasename WSS_CompanyIntra
    net
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    C:\PS>New-Sharepoint3Site -sitetemplate STS#2 -url https://intranet.company.com/documents `
    
    
    -ownerlogin administrator -owneremail administrator@company.com -title "Company Dodcument Site"
     `
             -databasename WSS_CompanyDocument
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/SharePointManagement#New-Sharepoint3Site



```
## Get-Sharepoint3Sites ##
```

NAME
    Get-Sharepoint3Sites
    
SYNOPSIS
    List sites on Sharepoint Server
    
SYNTAX
    Get-Sharepoint3Sites [-RootURL] <String> [<CommonParameters>]
    
    
DESCRIPTION
    List the number of existing sites on Windows Sharepoint Services 
    web server.
    

PARAMETERS
    -RootURL <String>
        This is the base URL of your Sharepoint installation
        
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
    
    
        The STSADM command needs to be on your path, or run the script from inside the folder
        The information returned is in the form of an XML file, you will
        need to [xml] cast a variable in order to metriculate through it.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Get-Sharepoint3Site -RootURL http://intranet.company.com
    
    
    
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    C:\PS>$sites = [xml](Get-Sharepoint3Sites -RootURL http://intranet.company.com)
    
    
    $sites.Sites.Site[3].Url
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/SharePointManagement#Get-Sharepoint3Sites



```
## New-Sharepoint3Path ##
```

NAME
    New-Sharepoint3Path
    
SYNOPSIS
    Creates a managed path on the Sharepoint Server.
    
SYNTAX
    New-Sharepoint3Path [-RootURL] <String> [-SitePath] <String> [<CommonParameters>]
    
    
DESCRIPTION
    Creates a wild card managed path on the Sharepoint Server.
    

PARAMETERS
    -RootURL <String>
        This is the root url of the Windows Sharepoint Services web server
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -SitePath <String>
        This is the path to the new site from the RootURL
        
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
    
    
        The STSADM command needs to be on your path, or run the script from inside the folder
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>new-sharepoint3path -RootURL http://intranet.company.com -SitePath /documents/team-docs
    
    
    
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/SharePointManagement#New-Sharepoint3Path



```
## New-Sharepoint3Subweb ##
```

NAME
    New-Sharepoint3Subweb
    
SYNOPSIS
    Creates a subsite at the specified Uniform Resource Locator (URL).
    
SYNTAX
    New-Sharepoint3Subweb [-SiteURL] <String> [[-SiteTemplate] <String>] [[-Title] <String>] [[-Des
    cription] <String>] [<CommonParameters>]
    
    
DESCRIPTION
    Creates a subsite at the specified Uniform Resource Locator (URL).
    

PARAMETERS
    -SiteURL <String>
        The URL where the subsite should be created. This should be a path below an existing site c
        ollection or 
        subsite.
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -SiteTemplate <String>
        Specifies the type of template to be used by the newly created site.
        If you do not specify a template to use, the owner can choose a template when he or she fir
        st browses to
        the site.
            
        The value must be in the form name#configuration. If you do not specify the configuration, 
        (for example,
        STS) configuration 0 is the default (for example, STS#0).
            
        The list of available templates can be customized to include templates you create. To displ
        ay a list of 
        custom templates, use the Enumtemplates operation.
        
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -Title <String>
        The title of the new subsite.
        The maximum length is 255 characters.
        
        Required?                    false
        Position?                    3
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -Description <String>
        Description of the new subsite.
        
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
    
    
        The STSADM command needs to be on your path, or run the script from inside the folder.
        http://technet.microsoft.com/en-us/library/cc287718(office.12).aspx
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>New-Sharepoint3Subweb -SiteURL http://schmoopy/subweb2 -SiteTemplate sts#2 -Title "This i
    s my subweb" `
    
    
    -Description "This is an awesome description for my site."
    
    Description
    -----------
    This example shows the basic usage of the function with all parameters specified.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/SharePointManagement#New-Sharepoint3Subweb



```
## Get-SPListIds ##
```

NAME
    Get-SPListIds
    
SYNOPSIS
    Get the ID's and titles from a given list
    
SYNTAX
    Get-SPListIds [[-Site] <Object>] [[-SitePath] <Object>] [<CommonParameters>]
    
    
DESCRIPTION
    This function returns the ID and Title from a given list.
    

PARAMETERS
    -Site <Object>
        The URL of the sharepoint web
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -SitePath <Object>
        The path to the sharepoint site
        
        Required?                    false
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
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Get-SPListIds -Site "http://intranet.company.com" -SitePath "Blog/Lists/Categories/"
    
    
    
    
    
    
    
    
    
RELATED LINKS



```
## New-SPListItem ##
```

NAME
    New-SPListItem
    
SYNOPSIS
    Add an item to an existing list
    
SYNTAX
    New-SPListItem [[-Site] <Object>] [[-SitePath] <Object>] [[-ItemValue] <Object>] [<CommonParame
    ters>]
    
    
DESCRIPTION
    This function adds and item to an existing list and returns that item's ID.
    

PARAMETERS
    -Site <Object>
        The URL of the sharepoint web
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -SitePath <Object>
        The path to the sharepoint site
        
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -ItemValue <Object>
        The item to be added to the list
        
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
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>New-SPListItem -Site "http://intranet.company.com" -SitePath "Blog/Lists/Categories/" -It
    emValue "SharePoint"
    
    
    
    
    
    
    
    
    
RELATED LINKS



```
## Get-SPListItem ##
```

NAME
    Get-SPListItem
    
SYNOPSIS
    Get the ID's and titles from a given list
    
SYNTAX
    Get-SPListItem [[-Site] <Object>] [[-SitePath] <Object>] [[-LookupValue] <Object>] [<CommonPara
    meters>]
    
    
DESCRIPTION
    This function returns the ID and Title from a given list.
    

PARAMETERS
    -Site <Object>
        The URL of the sharepoint web
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -SitePath <Object>
        The path to the sharepoint site
        
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -LookupValue <Object>
        
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
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Get-SPListItem -Site "http://intranet.company.com" -SitePath "Blog/Lists/Categories/" -Lo
    okupValue "cat1"
    
    
    
    
    
    
    
    
    
RELATED LINKS



```
## New-SPDocLibFolder ##
```

NAME
    New-SPDocLibFolder
    
SYNOPSIS
    Create a new folder in a SharePoint Document Library
    
SYNTAX
    New-SPDocLibFolder [[-Site] <Object>] [[-SitePath] <Object>] [[-Folder] <Object>] [<CommonParam
    eters>]
    
    
DESCRIPTION
    This function will create a folder inside the Document Library, the return is the ID of 
    the folder.
    

PARAMETERS
    -Site <Object>
        The URL of the SharePoint site
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -SitePath <Object>
        The path to the application on the site
        
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -Folder <Object>
        The name of the folder to create
        
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
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>New-SPDocLibFolder -Site "http://intranet.company.com/" -SitePath "Shared Documents" -Fol
    der "New Folder"
    
    
    
    
    
    
    
    
    
RELATED LINKS



```
## Add-SPFileToDocLib ##
```

NAME
    Add-SPFileToDocLib
    
SYNOPSIS
    Add a file to a SharePoint Document Library
    
SYNTAX
    Add-SPFileToDocLib [[-Site] <Object>] [[-SitePath] <Object>] [[-FilePath] <Object>] [<CommonPar
    ameters>]
    
    
DESCRIPTION
    This function will add a file to a Dcoument Library and return the resulting object
    

PARAMETERS
    -Site <Object>
        The URL of the SharePoint site
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -SitePath <Object>
        The path to the application on the site
        
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -FilePath <Object>
        The fileobject to upload to the server
        
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
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Add-SPFileToDocLib -Site "http://intranet.company.com/" -SitePath "Shared Documents" -Fil
    ePath (Get-ChildItem .\image.png)
    
    
    
    
    
    
    
    
    
RELATED LINKS



```