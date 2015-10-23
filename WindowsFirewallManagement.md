## Get-FWServices ##
```

NAME
    Get-FWServices
    
SYNOPSIS
    Return a list of services allowed through the firewall
    
SYNTAX
    Get-FWServices [<CommonParameters>]
    
    
DESCRIPTION
    This function returns a list of services and related ports that are allowed through the Windows
     Firewall
    

PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer and OutVariable. For more information, type,
        "get-help about_commonparameters".
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Get-FWServices |Format-Table
    
    
    Property  Name           Type Customize IpVersion     Scope RemoteAdd   Enabled Protocol  Port
                                            d                     resses
    --------  ----           ---- --------- ---------     ----- ---------   ------- --------  ----
    Service   File a...         0     False         2         1 LocalS...      True -         -
    Port      File a...         -         -         2         1 LocalS...      True 17        138
    Service   Networ...         1     False         2         1 LocalS...     False -         -
    Port      Networ...         -         -         2         1 LocalS...     False 6         2869
    Service   Remote...         2     False         2         0 *             False -         -
    Port      Remote...         -         -         2         0 *             False 6         3389
    
    Description
    -----------
    This example shows the output of the function piped through Format-Table
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/WindowsFirewallManagement#Get-FWServices



```
## Get-FWApplications ##
```

NAME
    Get-FWApplications
    
SYNOPSIS
    Return a list of applicaitons allowed
    
SYNTAX
    Get-FWApplications [<CommonParameters>]
    
    
DESCRIPTION
    This function returns a list of applications that have been authorized through the Windows Fire
    wall.
    

PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer and OutVariable. For more information, type,
        "get-help about_commonparameters".
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Get-FWApplications |Format-Table
    
    
    ProcessImageFi Name               IpVersion Property      RemoteAddress       Enabled         S
    cope
    leName                                                    es
    -------------- ----               --------- --------      -------------       -------         -
    ----
    C:\Program ... VMware Authd               2 Application   *                      True          
       0
    C:\Program ... Bonjour Ser...             2 Application   *                      True          
       0
    C:\users\je... dropbox.exe                2 Application   *                      True          
       0
    C:\program ... Opera Inter...             2 Application   *                      True          
       0
    C:\program ... Microsoft O...             2 Application   *                      True          
       0
    
    Description
    -----------
    Sample output piped through Format-Table
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/WindowsFirewallManagement#Get-FWApplications



```
## Get-FWGloballyOpenPorts ##
```

NAME
    Get-FWGloballyOpenPorts
    
SYNOPSIS
    Return ports that are open across all profiles.
    
SYNTAX
    Get-FWGloballyOpenPorts [<CommonParameters>]
    
    
DESCRIPTION
    This function returns a list of Globally Open Ports that are available on the Windows Firewall
    

PARAMETERS
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer and OutVariable. For more information, type,
        "get-help about_commonparameters".
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Get-FWGloballyOpenPorts |Format-Table
    
    
    RemoteAddres Name            IpVersion         Port       Scope    Protocol     Enabled     Bui
    ltIn
    ses
    ------------ ----            ---------         ----       -----    --------     -------     ---
    ----
    *            Allowed P...            2          456           0          17        True       F
    alse
    *            Allowed P...            2          123           0           6        True       F
    alse
    
    Description
    -----------
    Sample output piped through Format-Table
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/WindowsFirewallManagement#Get-FWGloballyOpenPorts



```
## New-FWPortOpening ##
```

NAME
    New-FWPortOpening
    
SYNOPSIS
    Create a port opening in Windows Firewall.
    
SYNTAX
    New-FWPortOpening [[-RuleName] <String>] [[-RuleProtocol] <Int32>] [[-RulePort] <Double>] [[-Ru
    leRemoteAddresses] <String>] [[-RuleEnabled] <Boolean>] [<CommonParameters>]
    
    
DESCRIPTION
    This function creates a port opening in the Windows Firewall.
    

PARAMETERS
    -RuleName <String>
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -RuleProtocol <Int32>
        
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -RulePort <Double>
        
        Required?                    false
        Position?                    3
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -RuleRemoteAddresses <String>
        
        Required?                    false
        Position?                    4
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -RuleEnabled <Boolean>
        
        Required?                    false
        Position?                    5
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
    
    
        In order for this function to work properly you will need to run this function in an elevat
        ed PowerShell
        prompt, as well as have the permissions to modify the firewall.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>New-FWPortOpening -RuleName Rule1 -RuleProtocol 6 -RulePort 123 -RuleRemoteAddresses *
    
    
    Get-FWGloballyOpenPorts
    
    RemoteAddresses : *
    Name            : Rule1
    IpVersion       : 2
    Port            : 123
    Scope           : 0
    Protocol        : 6
    Enabled         : False
    BuiltIn         : False
        
    Description
    -----------
    This example shows setting a portopening, and then viewing the newly created rule.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/WindowsFirewallManagement#New-FWPortOpening



```