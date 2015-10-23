# !New-IscsiDriveMaps.ps1 #
```

NAME
    C:\mod-posh\powershell\production\New-IscsiDriveMaps.ps1
    
SYNOPSIS
    Create iSCSI drive maps on one or more servers
    
SYNTAX
    C:\mod-posh\powershell\production\New-IscsiDriveMaps.ps1 [-FileName] <Object> [[-ServerName] <O
    bject>] [-Favorites] <Object> [-LoginTarget] <Object> [<CommonParameters>]
    
    
DESCRIPTION
    Making life easier by creating the iSCSI drive mappings via Powershell. 
    However, the Microsoft Initiator isn't natively powershell enabled, the calls
    must be made through the command line interface of iscsicli.exe.
    This script addresses the pain involved in dealing with larger numbers of servers, 
    in our data center this includes numerous Hyper-V Clusters with 
    Clustered Shared Volumes where we'd have quite a lot of UI clicking to do.
    

PARAMETERS
    -FileName <Object>
        The comma seperated file is easily managed with native powershell cmdlets.
        The file header includes: 
        
        Hostname,Cluster,IP,InitiatorIQN,iSCSI_Portal,iSCSI_Target
        
        Hostname     : Server Hostname, ie: "command prompt 'hostname'"
        IP           : Preferred source IP for the initiator
        InitiatorIQN : Not required for the scripts, but useful as a reference
        iSCSI_Portal : IP of the target portal
        iSCSI_Target : Full IQN of the target volume
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -ServerName <Object>
        If specified the server to target this script at, otherwise use the CSV.
        
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -Favorites <Object>
        True or False, Add the Target to the Favorites list
        
        Required?                    true
        Position?                    3
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -LoginTarget <Object>
        True or False, Login to the target for this session
        
        Required?                    true
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
    
    
        This script was originally written by Dynamic IT, and the source URL is the second link.
        I really liked the script and felt that the original could use a little more PowerShell
        loving, so I took nearly all the original code and as best as I could took in the 
        original intent.
        
        I noted that it appeared that they used a couple of values, Favorites and LoginTargets 
        as more or less switches. I set those as a parameter and defaulted to true, so that
        code runs by default.
        
        The VolumeMaps code was more or less the same, I left the ServerName parameter blank
        and if it's present we then filter the CSV by the ServerName. This also took out the 
        need to check if only 1 arg was passed.
        
        ScriptName : New-IscsiDriveMaps.ps1
        Created By : jspatton
        Date Coded : 11/21/2011 15:52:18
        ScriptName is used to register events for this script
        LogName is used to determine which classic log to write to
        
        ErrorCodes
            100 = Success
            101 = Error
            102 = Warning
            104 = Information
        
        Making life easier by creating the iSCSI drive mappings via Powershell. 
        However, the Microsoft Initiator isn't natively powershell enabled, the calls
        must be made through the command line interface of iscsicli.exe.
        This script addresses the pain involved in dealing with larger numbers of servers, 
        in our data center this includes numerous Hyper-V Clusters with 
        Clustered Shared Volumes where we'd have quite a lot of UI clicking to do.
        Import CSV for the list of Hostnames, Portals and Targets (volumes)
        The comma seperated file is easily managed with native powershell cmdlets.
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>.\New-IscsiDriveMaps.ps1 -FileName 'C:\Temp\IscsiMaps.csv'
    
    
    Description
    -----------
    This is an example of the basic usage of this command.
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    C:\PS>.\New-IscsiDriveMaps.ps1 -FileName 'C:\Temp\IscsiMaps.csv' -ServerName 'Server-01'
    
    
    Description
    -----------
    This example shows the basic usage, passing in one server to work on.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/New-IscsiDriveMaps.ps1
     http://blogs.technet.com/b/mpsc_dynamic_it/archive/2010/01/30/using-powershell-remoting-iscsic
    li-exe-to-connect-your-clustered-shared-volumes.aspx
     http://www.microsoft.com/download/en/details.aspx?id=6408
    
    requires -version 2



```