## Get-LPInputFormat ##
```

NAME
    Get-LPInputFormat
    
SYNOPSIS
    Returns Log Parser Input Format object based on passed string
    
SYNTAX
    Get-LPInputFormat [[-InputType] <String>] [<CommonParameters>]
    
    
DESCRIPTION
    Returns Log Parser Input Format object based on passed string
    

PARAMETERS
    -InputType <String>
        
        Required?                    false
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
    
    
        You will need to download and install Microsoft's LogParser, you can find it at this URL:
        http://www.microsoft.com/downloads/en/details.aspx?FamilyID=890cd06b-abf8-4c25-91b2-f8d975c
        f8c07
        
        The original code was pulled from http://muegge.com/blog/?p=65 I have just moved his commen
        t blocks down
        into the PowerShell v2 internal help system.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    Get-LPInputFormat -InputType <string>
    
    
    
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/MueggeLogParser#get-LPInputFormat



```
## Get-LPOutputFormat ##
```

NAME
    Get-LPOutputFormat
    
SYNOPSIS
    Returns Log Parser Output Format object based on passed string
    
SYNTAX
    Get-LPOutputFormat [[-OutputType] <String>] [<CommonParameters>]
    
    
DESCRIPTION
    Returns Log Parser Output Format object based on passed string
    

PARAMETERS
    -OutputType <String>
        
        Required?                    false
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
    
    
        You will need to download and install Microsoft's LogParser, you can find it at this URL:
        http://www.microsoft.com/downloads/en/details.aspx?FamilyID=890cd06b-abf8-4c25-91b2-f8d975c
        f8c07
        
        The original code was pulled from http://muegge.com/blog/?p=65 I have just moved his commen
        t blocks down
        into the PowerShell v2 internal help system.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    Get-LPOutputFormat -OutputType <string>
    
    
    
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/MueggeLogParser#Get-LPOutputFormat



```
## Invoke-LPExecute ##
```

NAME
    Invoke-LPExecute
    
SYNOPSIS
    Executes a Log Parser Query and returns a recordset
    
SYNTAX
    Invoke-LPExecute [[-query] <String>] [[-inputtype] <Object>] [<CommonParameters>]
    
    
DESCRIPTION
    Executes a Log Parser Query and returns a recordset
    

PARAMETERS
    -query <String>
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -inputtype <Object>
        
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
    
    
        You will need to download and install Microsoft's LogParser, you can find it at this URL:
        http://www.microsoft.com/downloads/en/details.aspx?FamilyID=890cd06b-abf8-4c25-91b2-f8d975c
        f8c07
        
        The original code was pulled from http://muegge.com/blog/?p=65 I have just moved his commen
        t blocks down
        into the PowerShell v2 internal help system.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    Invoke-LPExecute -query <string>
    
    
    
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/MueggeLogParser#Invoke-LPExecute



```
## Invoke-LPExecuteBatch ##
```

NAME
    Invoke-LPExecuteBatch
    
SYNOPSIS
    Executes Log Parser batch query with passed input and output types
    
SYNTAX
    Invoke-LPExecuteBatch [[-query] <String>] [[-inputtype] <Object>] [[-outputtype] <Object>] [<Co
    mmonParameters>]
    
    
DESCRIPTION
    Executes Log Parser batch query with passed input and output types
    

PARAMETERS
    -query <String>
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -inputtype <Object>
        
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -outputtype <Object>
        
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
    
    
        You will need to download and install Microsoft's LogParser, you can find it at this URL:
        http://www.microsoft.com/downloads/en/details.aspx?FamilyID=890cd06b-abf8-4c25-91b2-f8d975c
        f8c07
        
        The original code was pulled from http://muegge.com/blog/?p=65 I have just moved his commen
        t blocks down
        into the PowerShell v2 internal help system.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    Invoke-LPExecuteBatch -query <string>-inputtype <LogParserInputFormat> -outputtype <LogParserOu
    tputFormat>
    
    
    
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/MueggeLogParser#Invoke-LPExecuteBatch



```
## Get-LPRecord ##
```

NAME
    Get-LPRecord
    
SYNOPSIS
    Returns PowerShell custom object from Log Parser recordset for current record
    
SYNTAX
    Get-LPRecord [[-LPRecordSet] <Object>] [<CommonParameters>]
    
    
DESCRIPTION
    Returns PowerShell custom object from Log Parser recordset for current record
    

PARAMETERS
    -LPRecordSet <Object>
        
        Required?                    false
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
    
    
        You will need to download and install Microsoft's LogParser, you can find it at this URL:
        http://www.microsoft.com/downloads/en/details.aspx?FamilyID=890cd06b-abf8-4c25-91b2-f8d975c
        f8c07
        
        The original code was pulled from http://muegge.com/blog/?p=65 I have just moved his commen
        t blocks down
        into the PowerShell v2 internal help system.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    Get-LPRecord -rs <RecordSet>
    
    
    
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/MueggeLogParser#Get-LPRecord



```
## Get-LPRecordSet ##
```

NAME
    Get-LPRecordSet
    
SYNOPSIS
    Executes a Log Parser Query and returns a LogRecordSet as a custom powershell object
    
SYNTAX
    Get-LPRecordSet [[-query] <String>] [<CommonParameters>]
    
    
DESCRIPTION
    Executes a Log Parser Query and returns a LogRecordSet as a custom powershell object
    

PARAMETERS
    -query <String>
        
        Required?                    false
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
    
    
        You will need to download and install Microsoft's LogParser, you can find it at this URL:
        http://www.microsoft.com/downloads/en/details.aspx?FamilyID=890cd06b-abf8-4c25-91b2-f8d975c
        f8c07
        
        The original code was pulled from http://muegge.com/blog/?p=65 I have just moved his commen
        t blocks down
        into the PowerShell v2 internal help system.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    Get-LPRecordSet -query <string>
    
    
    
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/MueggeLogParser#Get-LPRecordSet



```