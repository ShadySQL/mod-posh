## New-QfePatch ##
```

NAME
    New-QfePatch
    
SYNOPSIS
    Create the QFE metadata file on the server
    
SYNTAX
    New-QfePatch [-URL] <String> [-KB] <String> [-OS] <String> [-Arch] <String> [-QfeFilename] <String> [-Test] <Object> [-Answer] <Object> [[-QfeServer] <String>] [<CommonParameters>
    ]
    
    
DESCRIPTION
    This function will create an XML metadata file for each QFE for each affected OS. This
    is not an automatic action, the admin will need to provide all the details for the 
    hotfix (QFE).
    
    The intended workflow would be an issue is identified on one or more servers. The issue
    is researched and a hotfix is found that addresses this issue. The admin then writes a 
    simple test that will evaluate to true or false depending on the test (eg. checking
    the version information of a file is common). Once the test is confirmed against an
    affected server, the patch is downloaded to a central respository, and all the information
    is passed to this function to create an XML file for later use.
    

PARAMETERS
    -URL <String>
        This is the URL from the Microsoft support site that contains the details
        regarding this hotfix.
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -KB <String>
        This is the numeric article for the hotfix. This information is used to
        generate the QfeId, as well as a filter for other functions.
        
        Required?                    true
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -OS <String>
        This is the OS of the target system. Ideally this would be the output of
        Get-WmiObject -Query 'Select Caption from Win32_OperatingSystem'. This is what
        in other functions within the library. If there is a difference then lookups
        won't work as expected.
        
        Required?                    true
        Position?                    3
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -Arch <String>
        This would be the 3 to 4 character representation that is used for process architecture
        x86, x64, ia64
        
        Required?                    true
        Position?                    4
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -QfeFilename <String>
        
        Required?                    true
        Position?                    5
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -Test <Object>
        This should be a simple test that would evaluate out to true or false. For example
        KB981314 makes a change to cimwin32.dll, as a result the private revision number
        for the file changes. The article displays what the new version should be, so it's
        a simple get-item to check the existing version number and compare it to the new. If
        they don't match, then we need to update, otherwise no update needed.
        
        Required?                    true
        Position?                    6
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -Answer <Object>
        This is what we test against. If the answer is 20683, then any value other than 20683
        results in a false, which means the patch should be applied.
        
        Required?                    true
        Position?                    7
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -QfeServer <String>
        This is the path to where the QFEs and their metadata should be stored. It can be in 
        the form of a shared folder:
            \\fs\share\hotfixes
        
        or as a local path:
            C:\hotfixes
        
        Required?                    false
        Position?                    8
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
    
    
        FunctionName : New-QfePatch
        Created by   : jspatton
        Date Coded   : 07/09/2012 11:16:28
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>New-QfePatch
    
    
    -URL 'http://support.microsoft.com/kb/981314' 
        -KB 981314 
        -OS (Get-WmiObject -Class Win32_OperatingSystem |Select-Object -Property Caption -ExpandProperty Caption) 
        -Arch 'x64' 
        -Test '(Get-Item -Path C:\Windows\System32\wbem\cimwin32.dll).VersionInfo.FilePrivatePart' 
        -Answer 20683
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/QfeLIbrary#New-QfePatch



```
## Test-QfePatch ##
```

NAME
    Test-QfePatch
    
SYNOPSIS
    Verify that the hotfix is needed for this system.
    
SYNTAX
    Test-QfePatch [-QfeId] <String> [[-QfeServer] <String>] [<CommonParameters>]
    
    
DESCRIPTION
    This function will read in the metadata from the provided QfeId and extract
    the test and answer properties. This test doesn't install the patch it simply
    runs the test and compares it to the answer. If they don't equal then the patch
    is assumed to be needed.
    
    Whether the hotfix acutally gets installed is handled by wusa in a seperate
    function.
    

PARAMETERS
    -QfeId <String>
        This is the generated Id based on the KB, OS and Arch. To get a list of 
        QFE's you can run Get-QfeList.
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -QfeServer <String>
        This is the path to where the QFEs and their metadata should be stored. It can be in 
        the form of a shared folder:
            \\fs\share\hotfixes
        
        or as a local path:
            C:\hotfixes
        
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
    
    
        FunctionName : Test-QfePatch
        Created by   : jspatton
        Date Coded   : 07/09/2012 11:55:03
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Test-QfePatch -QfeId '977944-Microsoft-Windows-7-Enterprise-x64'
    
    
    
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/QfeLIbrary#Test-QfePatch



```
## Get-QfeList ##
```

NAME
    Get-QfeList
    
SYNOPSIS
    Get a list of available QFE's from the server.
    
SYNTAX
    Get-QfeList [[-QfeServer] <String>] [-All] [-Download] [[-LocalPath] <Object>] [<CommonParameters>]
    
    
DESCRIPTION
    This function will return a list of available QFE's that are available. The default
    action is to return only a list of QFE's where the client OS matches the OS property
    of QFE metadata file. This behaviour can be overridden by the -All switch.
    
    In addition to returning a list of available QFE's, you can also specify the -Download
    switch to optionally download all the QFE's or just the ones for your OS.
    

PARAMETERS
    -QfeServer <String>
        This is the path to where the QFEs and their metadata should be stored. It can be in 
        the form of a shared folder:
            \\fs\share\hotfixes
        
        or as a local path:
            C:\hotfixes
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -All [<SwitchParameter>]
        When present the list of QFE's returned is filtered against the client OS. It's
        important that the client OS matches the OS property of the QFE. 
        
        See the help for New-QfePatch for more information about the OS property.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -Download [<SwitchParameter>]
        When present the list of QFE's will be downloaded locally to the client.
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -LocalPath <Object>
        This is the location to where the hotfix files and their metadata will be 
        downloaded to. The default location is C:\HotFixes, if it doesn't exist it
        will be created.
        
        This folder only get's created, if -Download is present.
        
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
    
    
        FunctionName : Get-QfeList
        Created by   : jspatton
        Date Coded   : 07/09/2012 12:10:14
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Get-QfeList
    
    
    QfeId : 977944-Microsoft-Windows-7-Enterprise-x64
    KB    : 977944
    URL   : http://support.microsoft.com/kb/977944
    OS    : Microsoft Windows 7 Enterprise
    Arch  : x64
    
    QfeId : 981314-Microsoft-Windows-7-Enterprise-x64
    KB    : 981314
    URL   : http://support.microsoft.com/kb/981314
    OS    : Microsoft Windows 7 Enterprise
    Arch  : x64
    
    Description
    -----------
    This example shows the default behaviour of the function. The list of QFE's matches
    the client OS, Microsoft Windows 7 Enterprise.
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    C:\PS>Get-QfeList -All
    
    
    QfeId : 977944-Microsoft-Windows-7-Enterprise-x64
    KB    : 977944
    URL   : http://support.microsoft.com/kb/977944
    OS    : Microsoft Windows 7 Enterprise
    Arch  : x64
    
    QfeId : 981314-Microsoft-Windows-7-Enterprise-x64
    KB    : 981314
    URL   : http://support.microsoft.com/kb/981314
    OS    : Microsoft Windows 7 Enterprise
    Arch  : x64
    
    QfeId : 981314-Microsoft-Windows-Server-2008-R2-Enterprise-x64
    KB    : 981314
    URL   : http://support.microsoft.com/kb/981314
    OS    : Microsoft Windows Server 2008 R2 Enterprise
    Arch  : x64
    
    Description
    -----------
    This example shows additional QFE's because the -All switch was passed into the function.
    
    
    
    
    
    -------------------------- EXAMPLE 3 --------------------------
    
    C:\PS>Get-QfeList -All -Download -LocalPath c:\temp
    
    
    Description
    -----------
    This example will download all QFE's to the c:\temp folder on the local computer.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/QfeLIbrary#Get-QfeList



```
## Set-QfeServer ##
```

NAME
    Set-QfeServer
    
SYNOPSIS
    Define the location for QFE's for this session.
    
SYNTAX
    Set-QfeServer [-QfeServer] <Object> [<CommonParameters>]
    
    
DESCRIPTION
    This function set's a global variable QfeServer that is able to be used
    throughout your current PowerShell session.
    

PARAMETERS
    -QfeServer <Object>
        This is the path to where the QFEs and their metadata should be stored. It can be in 
        the form of a shared folder:
            \\fs\share\hotfixes
        
        or as a local path:
            C:\hotfixes
        
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
    
    
        FunctionName : Set-QfeServer
        Created by   : jspatton
        Date Coded   : 07/09/2012 13:01:13
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Set-QfeServer -QfeServer c:\hotfix
    
    
    Description
    -----------
    This example shows setting the QfeServer to a local path
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    C:\PS>Set-QfeServer -QfeServer \\fs\share\hotfix
    
    
    Description
    -----------
    This example shows setting the QfeServer to a UNC path.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/QfeLIbrary#Set-QfeServer



```
## Install-QfePatch ##
```

NAME
    Install-QfePatch
    
SYNOPSIS
    Install a hotfix on the local computer
    
SYNTAX
    Install-QfePatch [[-QfeFilename] <Object>] [<CommonParameters>]
    
    
DESCRIPTION
    This function will install a hotfix on the local computer using WUSA.exe. For more
    information on WUSA please see the related links at the bottom of this help file.
    
    Installation is completely handled by WUSA. Regardless of what Test-QfePatch returns
    WUSA has the last say in whether the patch is needed. It's beyond my depth to any more
    than just a simple test to check.
    
    We query the WMI class Win32_QuickFixEngineering to see if the hotfix is already installed
    before we do anything. If it exists in the list, we're done. If not, we install the patch.
    For verification I pass the /log paramter to WUSA so a logfile is generated in the
    same location as the hotfix. If there are any error's reported in the log those are
    returned at the end of the processing.
    
    I think the most common error would be
        Windows update  could not be installed because of error 2149842967
        
    This indicates that the hotfix is not needed for this computer. Most likely the computer
    has already been patched, or has a service pack installed with the included hotfix.
    

PARAMETERS
    -QfeFilename <Object>
        This is the XML metadata file that gets copied to the local computer when Get-QfeList -Download
        is used. You can install these one at a time, or pass them over the pipeline.
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue)
        Accept wildcard characters?  
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer and OutVariable. For more information, type,
        "get-help about_commonparameters".
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        FunctionName : Install-QfePatch
        Created by   : jspatton
        Date Coded   : 07/09/2012 14:23:45
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Get-ChildItem C:\Hotfixes\ |Install-QfePatch
    
    
    Description
    -----------
    This example passes in all filese stored in the Hotfixes folder. The function will only
    process an XML file, and we assume the only XML files are the ones we created with the
    New-QfePatch function.
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    C:\PS>Install-QfePatch -QfeFilename C:\Hotfixes\977944-Microsoft-Windows-7-Enterprise-x64.xml
    
    
    Description
    -----------
    This example shows installing a specific hotfix.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/QfeLIbrary#Install-QfePatch
     http://support.microsoft.com/kb/934307



```
## Uninstall-QfePatch ##
```

NAME
    Uninstall-QfePatch
    
SYNOPSIS
    Uninstall a hotfix from the local computer
    
SYNTAX
    Uninstall-QfePatch [[-QfeFilename] <Object>] [<CommonParameters>]
    
    
DESCRIPTION
    This function will uninstall a hotfix from the local computer using WUSA.exe. For more
    information on WUSA please see the related links at the bottom of this help file.
    
    We query the WMI class Win32_QuickFixEngineering to see if the hotfix is already installed
    before we do anything. If it exists in the list, we uninstall the patch. For verification 
    I pass the /log paramter to WUSA so a logfile is generated in the same location as the 
    hotfix. If there are any error's reported in the log those are returned at the end of 
    the processing.
    

PARAMETERS
    -QfeFilename <Object>
        This is the XML metadata file that gets copied to the local computer when Get-QfeList -Download
        is used. You can install these one at a time, or pass them over the pipeline.
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue)
        Accept wildcard characters?  
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer and OutVariable. For more information, type,
        "get-help about_commonparameters".
    
INPUTS
    
OUTPUTS
    
NOTES
    
    
        FunctionName : Uninstall-QfePatch
        Created by   : jspatton
        Date Coded   : 07/09/2012 14:23:58
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Get-ChildItem C:\Hotfixes\ |Uninstall-QfePatch
    
    
    Description
    -----------
    This example passes in all filese stored in the Hotfixes folder. The function will only
    process an XML file, and we assume the only XML files are the ones we created with the
    New-QfePatch function.
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    C:\PS>Uninstall-QfePatch -QfeFilename C:\Hotfixes\977944-Microsoft-Windows-7-Enterprise-x64.xml
    
    
    Description
    -----------
    This example shows uninstalling a specific hotfix.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/QfeLIbrary#Uninstall-QfePatch
     http://support.microsoft.com/kb/934307



```
## Get-Qfe ##
```

NAME
    Get-Qfe
    
SYNOPSIS
    Return information about a specific QFE
    
SYNTAX
    Get-Qfe [-QfeId] <String> [-Online] [[-QfeServer] <String>] [<CommonParameters>]
    
    
DESCRIPTION
    This function will return information about a specific QFE and if the -Online
    switch is present will open Internet Explorer to the URL defined in the QFE
    file.
    

PARAMETERS
    -QfeId <String>
        This is the generated Id based on the KB, OS and Arch. To get a list of 
        QFE's you can run Get-QfeList.
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -Online [<SwitchParameter>]
        
        Required?                    false
        Position?                    named
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -QfeServer <String>
        This is the path to where the QFEs and their metadata should be stored. It can be in 
        the form of a shared folder:
            \\fs\share\hotfixes
        
        or as a local path:
            C:\hotfixes
        
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
    
    
        FunctionName : Get-Qfe
        Created by   : jspatton
        Date Coded   : 07/10/2012 12:56:33
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Get-Qfe -QfeId 977944-Microsoft-Windows-7-Enterprise-x64
    
    
    Arch        : x64
    Answer      : 20600
    URL         : http://support.microsoft.com/kb/977944
    QfeFilename : Windows6.1-KB977944-x64.msu
    OS          : Microsoft Windows 7 Enterprise
    Test        : (Get-Item -Path C:\Windows\System32\shell32.dll).VersionInfo.FilePrivatePart
    QfeId       : 977944-Microsoft-Windows-7-Enterprise-x64
    KB          : 977944
    
    Description
    -----------
    This example shows the basic usage of this function.
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    C:\PS>Get-Qfe -QfeId 977944-Microsoft-Windows-7-Enterprise-x64 -Online
    
    
    Description
    -----------
    This example shows using the function with the online switch
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/QfeLIbrary#Get-Qfe



```
## Clear-QfeLocalStore ##
```

NAME
    Clear-QfeLocalStore
    
SYNOPSIS
    Archive the eventlogs and update files
    
SYNTAX
    Clear-QfeLocalStore [-LocalPath] <Object> [<CommonParameters>]
    
    
DESCRIPTION
    This function will create a zipfile inside the specified folder, and copy
    the eventlogs, update files and QFE metadata into that file. It will then
    remove everything but the zipfile.
    
    If you have previous archives inside the specified folder those are not removed
    only files that are not zip files are removed.
    

PARAMETERS
    -LocalPath <Object>
        This is the location to where the hotfix files and their metadata will be 
        downloaded to. The default location is C:\HotFixes, if it doesn't exist it
        will be created.
        
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
    
    
        FunctionName : Clear-QfeLocalStore
        Created by   : jspatton
        Date Coded   : 07/10/2012 15:50:28
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Clear-QfeLocalStore -LocalPath C:\Hotfixes
    
    
    Description
    -----------
    This example shows the basic usage of this function.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/QfeLIbrary#Clear-QfeLocalStore



```