# !Set-DefaultPrinter.ps1 #
```

NAME
    C:\mod-posh\powershell\production\Set-DefaultPrinter.ps1
    
SYNOPSIS
    Set the default printer for a given user account
    
SYNTAX
    C:\mod-posh\powershell\production\Set-DefaultPrinter.ps1 [-Filename] <Object> [<CommonParameter
    s>]
    
    
DESCRIPTION
    This script is run as a user logon script. The idea behind it is that not everyone needs the 
    same default printer, so this script checks the current user ($env:UserName) if they are listed
    in the PrinterMappingFile then the specific printer they requested as mapped to them.
    

PARAMETERS
    -Filename <Object>
        This is a .CSV file that contains a user column and a printer column. The user column shoul
        d be
        labled as Name and the printer column should be labeled as Printer. This file is processed 
        by
        the script to map a specific printer to a specific user.
        
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
    
    
        ScriptName: Set-DefaultPrinter
        Created By: Jeff Patton
        Date Coded: September 9, 2011
        ScriptName is used to register events for this script
        LogName is used to determine which classic log to write to
        
        ErrorCodes
            100 = Success
            101 = Error
            102 = Warning
            104 = Information
        
        This script should be added to a GPO for the OU that we need to make exceptions for. See th
        e first
        Technet article for more details on how to configure it.
            Script Name = PowerShell.exe
            Script Parameters = -noninteractive -command \\server\share\Set-DefaultPrinter.ps1 -Fil
        ename \\server\share\map.csv
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>.\Set-DefaultPrinter -PrinterMappingFile .\admin-suite.csv
    
    
    
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/Set-DefaultPrinter
     http://technet.microsoft.com/en-us/library/ee431705(WS.10).aspx
     http://technet.microsoft.com/en-us/library/ff731009.aspx



```