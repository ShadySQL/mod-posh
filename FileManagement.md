## Update-!Content ##
```

NAME
    Update-Content
    
SYNOPSIS
    Updates the contents of a file.
    
SYNTAX
    Update-Content [-FileName] <String> [-Content] <String> [[-Beginning] <Boolean>] [<CommonParame
    ters>]
    
    
DESCRIPTION
    This function adds content to the top or bottom of an existing file. By default the function wi
    ll update
    the beginning of a file.
    

PARAMETERS
    -FileName <String>
        The full path and filename to the file to update
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -Content <String>
        Content to add to the file
        
        Required?                    true
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -Beginning <Boolean>
        True or False to add content to top (true) or bottom (false) of file
        
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
    
    C:\PS>Update-Content -FileName "C:\logfiles\access.log" -Content "Host Identity User DateTime O
    ffset Request Status Size Referrer UserAgent"
    
    
    Description
             -----------
             This example sets a variable named header to be used in the command-line. We then pass
     the path and
    header variable into the function for processing.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/FileManagement#Update-Content



```
## New-LogFile ##
```

NAME
    New-LogFile
    
SYNOPSIS
    Create a logfile
    
SYNTAX
    New-LogFile [[-LogData] <Object>] [[-LogPath] <Object>] [<CommonParameters>]
    
    
DESCRIPTION
    This function create's a log file in the provided folder, whose data can be piped in via the co
    mmand
    line or passed directly to the function. The filename for the log is generated from the current
     system
    date, and if a file with same name exists, a new file is created with an incremented digit for 
    each
    matched filename.
    

PARAMETERS
    -LogData <Object>
        This is the information to send to the log.
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue)
        Accept wildcard characters?  
        
    -LogPath <Object>
        This is the destination of the log file. If the provided folder doesn't exist on the comput
        er, it 
        is created automatically.
        
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
    
    
        This space intentionally left blank.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Get-Process |New-LogFile
    
    
    Description
    -----------
    This example shows piping the output from Get-Process into the New-LogFile function, the defaul
    t
    log folder (C:\LogFiles) is used.
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    C:\PS>Get-Process |New-LogFile -LogPath c:\logging
    
    
    Description
    -----------
    This example shows piping the output from Get-Process into the New-LogFile function and specify
    ing a
    different folder to store the logs in.
    
    
    
    
    
    -------------------------- EXAMPLE 3 --------------------------
    
    C:\PS>New-LogFile -LogPath c:\logging -LogData "Script finished execution."
    
    
    Description
    -----------
    This example shows passing in the LogPath and LogData parameters to the New-LogFile function di
    rectly.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/FileManagement#New-LogFile



```
## Convert-!Delimiter ##
```

NAME
    Convert-Delimiter
    
SYNOPSIS
    A function to convert between different delimiters.
    
SYNTAX
    Convert-Delimiter [[-From] <Regex>] [[-To] <String>] [<CommonParameters>]
    
    
DESCRIPTION
    Written primarily as a way of enabling the use of Import-CSV when
    the source file was a columnar text file with data like services.txt:
        
    ip              service         port
    --              -------         ----
    13.13.13.1      http            8000
    13.13.13.2      https           8001
    13.13.13.1      irc             6665-6669
    

PARAMETERS
    -From <Regex>
        The delimiter that needs to be replaced
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -To <String>
        The delimiter to replace with
        
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
    
    
        This function was taken from http://poshcode.org/146 
        I tweaked it to fit my style of functions,  but otherwise the actual code that does all the
         
        work was left in tact.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Get-Content services.txt | Convert-Delimiter " +" "," | Set-Content services.csv
    
    
    Description
    -----------
    Would convert the file above into something that could passed to:
    Import-Csv services.csv
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/FileManagement#Convert-Delimiter



```
## Get-FileLogs ##
```

NAME
    Get-FileLogs
    
SYNOPSIS
    Get log data from requested log file.
    
SYNTAX
    Get-FileLogs [-LogFile] <Object> [-LogType] <Object> [[-TempPath] <Object>] [<CommonParameters>
    ]
    
    
DESCRIPTION
    This function returns the data from either an Apache, Windows Firewall or IIS log file. Very si
    mple 
    routine, it simply returns the data to be handled by some other function.
    

PARAMETERS
    -LogFile <Object>
        The path and filename to the log file to parse.
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -LogType <Object>
        The kind of logfile to work with, Apache, WFW or IIS.
        
        Required?                    true
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -TempPath <Object>
        A temporary path to write the output to.
        
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
    
    
        Each switch creates a temporary file that is removed before processing continues.
        This function depends on Convert-Delimiter being available.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Get-FileLogs -LogFile 'C:\LogFiles\scripts_access.log' -LogType apache |Format-Table
    
    
    RemoteHost  RemoteLogN RemoteUser Time       Request    Status     Size       Referer    UserAg
    ent
                ame
    ----------  ---------- ---------- ----       -------    ------     ----       -------    ------
    ---
    192.168.... -          -          [02/Mar... GET / H... 200        6730       -          Mozill
    a...
    192.168.... -          -          [02/Mar... GET /ch... 200        2457       http://... Mozill
    a...
    192.168.... -          -          [02/Mar... GET /ch... 200        3836       http://... Mozill
    a...
    192.168.... -          -          [02/Mar... GET /ch... 200        18449      http://... Mozill
    a...
    192.168.... -          -          [02/Mar... GET /ch... 200        4907       http://... Mozill
    a...
        
    Description
    -----------
    This example shows the output of the function being piped through Format-Table
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/FileManagement#Get-FileLogs
    Convert-Delimiter 



```