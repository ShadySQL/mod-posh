# !create-site.ps1 #
```

NAME
    C:\mod-posh\powershell\production\create-site.ps1
    
SYNOPSIS
    Create a new SharePoint site within a new SQL DB
    
SYNTAX
    C:\mod-posh\powershell\production\create-site.ps1 [-RootURL] <String> [-SitePath] <String> [<Co
    mmonParameters>]
    
    
DESCRIPTION
    Created March 8, 2011: Jeff Patton
    This script creates a new SharePoint site within a new SQL DB. It relies on several functions i
    nside the 
    SharePointManagement.ps1 library to work properly. You will need to provide the base URL of you
    r SharePoint 
    installation as well as the path to the new site to be created.
    

PARAMETERS
    -RootURL <String>
        This is the base URL of your WSS 3.0 installation
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -SitePath <String>
        This is the path to your new WSS 3.0 site
        
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
    
    
        Run script from Sharepoint server
        Run script as Administrator or disable UAC
        Script needs to be run under a SharePoint Farm Administrator account
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>create-site http://intranet.company.com team
    
    
    
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/create-site



```