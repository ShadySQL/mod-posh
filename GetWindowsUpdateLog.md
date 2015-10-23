# Get-WindowsUpdateLog.ps1 #
```

NAME
    C:\scripts\powershell\production\Get-WindowsUpdateLog.ps1
    
SYNOPSIS
    Get the Windows Update Log
    
SYNTAX
    C:\scripts\powershell\production\Get-WindowsUpdateLog.ps1 [[-Path] <String>] [[-Filter] <String>] [-Errors] [<CommonParameters>]
    
    
DESCRIPTION
    This script will grab the Windows Update Log and format it as an object for easier
    viewing and exporting. This script will also accept a filter parameter which will
    allow you to filter the data returned, based on any one of the defined field names
    below.
    
    Date      : yyy-mm-dd
    Time      : hh:mm:ss:ms
    PID       : ???
    TID       : ???
    Component : AGENT, AU, AUCLNT, CDM, CMPRESS, COMAPI, DRIVER, DTASTOR, DWNLDMGR, EEHDNLER
              : HANDLER, MISC, OFFLSNC, PARSER, PT, REPORT, SERVICE, SETUP, SHUTDWN, WUREDIR
              : WUWEB
    
    Each of these are text values see the example section for details on using the filter
    paramter with this script.
    

PARAMETERS
    -Path <String>
        This is the path to the Windows Update log file. The default location is the default
        value for this parameter.
        
        Required?                    false
        Position?                    1
        Default value                C:\Windows\WindowsUpdate.log
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    -Filter <String>
        This is a simple expression fieldname seperated by an equal sign and then the value. 
        
        For example:
        
            'Date=2012-10-24'
        
            Description
            -----------
            A filter to view the log for a specific date
        
            'component=au'
        
            Description
            -----------
            A filter to view the log for a specific component of the update service
        
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    -Errors [<SwitchParameter>]
        This is a switch parameter, if present it will override any filter and display only the
        entries from the log that are error messages.
        
        Required?                    false
        Position?                    named
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
    
    
        ScriptName : Get-WindowsUpdateLog
        Created By : jspatton
        Date Coded : 10/24/2012 10:44:12
        ScriptName is used to register events for this script
        
        ErrorCodes
            100 = Success
            101 = Error
            102 = Warning
            104 = Information
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>.\Get-WindowsUpdateLog.ps1
    
    
    Date      : 2012-10-18
    Time      : 11:26:40:141
    PID       : 856
    TID       : f34
    Component : Agent
    Text      : Update {1B90C35B-EE81-4568-A84B-8B5005ECAEC6}.1 is pruned out due to potential supersedence
    
    Description
    -----------
    Without any parameters the entire contents of the log will be displayed out on the console.
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    C:\PS>.\Get-WindowsUpdateLog.ps1 -Filter 'Date=2012-10-24'
    
    
    Date      : 2012-10-24
    Time      : 10:21:17:985
    PID       : 856
    TID       : 7e4
    Component : Service
    Text      : *************
    
    Desciption
    ----------
    This example shows a filter using a date, to return only entries that occurred on specific
    date.
    
    
    
    
    
    -------------------------- EXAMPLE 3 --------------------------
    
    C:\PS>.\Get-WindowsUpdateLog.ps1 -Filter 'component=DRIVER'
    
    
    Date      : 2012-10-18
    Time      : 14:07:41:390
    PID       : 856
    TID       : 1238
    Component : Driver
    Text      : Matched driver to device USB\VID_045E&PID_0745&REV_0633&MI_01
    
    Description
    -----------
    This example shows a filter using a component, this will return only entries that matched the
    Driver component.
    
    
    
    
    
    -------------------------- EXAMPLE 4 --------------------------
    
    C:\PS>.\Get-WindowsUpdateLog.ps1 -Filter 'Date=2012-10-24' |Export-Csv .\TodaysLogs.csv
    
    
    Description
    -----------
    This example shows piping the output of the script that is filtered by date, to a 
    csv file using the Export-Csv cmdlet.
    
    
    
    
    
    
RELATED LINKS
    https://code.google.com/p/mod-posh/wiki/Production/Get-WindowsUpdateLog



```