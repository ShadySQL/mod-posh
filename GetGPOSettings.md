# !Get-GPOSettings.ps1 #
```

NAME
    C:\mod-posh\powershell\production\Get-GPOSettings.ps1
    
SYNOPSIS
    Get-GPOSettings
    
SYNTAX
    C:\mod-posh\powershell\production\Get-GPOSettings.ps1 [[-GPOSettingName] <Object>] [[-GPOSettin
    gGuid] <Object>] [[-GPOComputerContext] <Object>] [<CommonParameters>]
    
    
DESCRIPTION
    This script gets a list of all Group Policy Objects in the domain filtered on the value
    of GPOSettingName. For each GPO if the Extension Name matches GPOSettingName the Extensions
    are then reported back.
    

PARAMETERS
    -GPOSettingName <Object>
        The name of the GPO Setting you want to filter on. This can be viewed by using the 
        GPO search function of the GPMC.
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -GPOSettingGuid <Object>
        The GUID of the GPOSettingName, the only way to determine this is to enable GPMC
        logging in the registry, and then grep the log file for the GPO Setting Name.
        
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -GPOComputerContext <Object>
        Any value other than $true will switch the script to evaluate the user policies.
        
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
    
    
        ScriptName: Get-GPOSettings.ps1
        Created By: Jeff Patton
        Date Coded: August 18, 2011
        ScriptName is used to register events for this script
        LogName is used to determine which classic log to write to
        This script relies on the Get-ADObject and Get-GPO cmdlet that are provided from
        the ActiveDirectory and GroupPolicy modules.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>.\Get-GPOSettings.ps1
    
    
    Description
    -----------
    
    The default syntax returns a list of Deployed Printer connections.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/Get-GPOSettings
     http://www.ldap389.info/en/2010/09/17/powershell-search-settings-gpo-parameter-configuration-g
    pmc/
     http://technet.microsoft.com/en-us/library/ee617198.aspx
     http://technet.microsoft.com/en-us/library/ee461059.aspx



```