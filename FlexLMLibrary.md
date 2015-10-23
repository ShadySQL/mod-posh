## Get-!FlexLMStatus ##
```

NAME
    Get-FlexLMStatus
    
SYNOPSIS
    Get FlexLM Status from server
    
SYNTAX
    Get-FlexLMStatus [[-QueryPort] <Object>] [[-LicenseServer] <Object>] [<CommonParameters>]
    
    
DESCRIPTION
    This function wraps the lmutil utility and returns an object
    that can be used to get the status of the flex license on
    the queried port.
    This function will return the port as specified in the license
    as opposed to what is passed in, it will return the licenseserver
    as defined in the license. Additionally it will return the 
    daemon and it's status.
    

PARAMETERS
    -QueryPort <Object>
        The port that the license is listening on. These are TCP ports
        that are open on the server and can be viewed with nstat -an. If
        not specified it will default to the standard Flex port 27000
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -LicenseServer <Object>
        This is the NetBios, FQDN or IP of the license server. If not
        specified it will default to the local host.
        
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
    
NOTES
    
    
        FunctionName : Get-FlexLMStatus
        Created by   : jspatton
        Date Coded   : 12/07/2011 12:01:29
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Get-FlexLMStatus -QueryPort 2701 -LicenseServer lic1 -Verbose
    
    
    VERBOSE: License server status: 1055@license1.soecs.ku.edu
    VERBOSE: License file(s) on license1.soecs.ku.edu: C:\Program Files\ANSYS Inc\Shared Files\Licensing\license.dat:
    VERBOSE: ansyslmd: UP v11.8
    
    
    LicensePath   : C:\Program Files\ANSYS Inc\Shared Files\Licensing\license.dat
    Daemon        : ansyslmd
    DaemonStatus  : UP
    LicenseServer : lic1.compny.com
    LicensePort   : 2701
    
    Description
    -----------
    This is the basic syntax of the command, this is showing using the -verbose switch
    to see the data as it's being processed from lmutil.
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    C:\PS>Get-FlexLMStatus
    
    
    LMUTIL not found. Please visit
    http://www.globes.com/support/fnp_utilities_download.htm
    
    The term 'lmutil' is not recognized as the name of a cmdlet, function, script fi
    le, or operable program. Check the spelling of the name, or if a path was includ
    ed, verify that the path is correct and try again.
    
    Description
    -----------
    This example shows the output when lmutil is not available on the system.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/FlexLMLibrary#Get-FlexLMStatus
     http://www.globes.com/support/fnp_utilities_download.htm



```