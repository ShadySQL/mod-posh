## Update-!Repo ##
```

NAME
    Update-Repo
    
SYNOPSIS
    Update your repository
    
SYNTAX
    Update-Repo [[-WorkingPath] <String>] [<CommonParameters>]
    
    
DESCRIPTION
    This function will update your working directory to the latest HEAD version of your repo.
    

PARAMETERS
    -WorkingPath <String>
        The default is to use the current working directory, but you can specify an alternate
        location on the command-line
        
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
    
    
        This function checks to see what the value of $SubversionClient is before executing
        the update.
        Define $SubversionClient in your $profile, the two possible values I check are:
            svn, tortoise
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Update-Repo
    
    
    At revision 378.
    True
    
    Description
    -----------
    This shows the basic usage with the default value for $WorkingPath
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    C:\PS>Update-Repo -WorkingPath'C:\Users\Jeff Patton\My Repositories\scripts'
    
    
    At revision 378.
    True
    
    Description
    -----------
    This shows passing an alternate directory into the function.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/SubversionManagement#Update-Repo



```
## New-!Repo ##
```

NAME
    New-Repo
    
SYNOPSIS
    Create a new repository folder.
    
SYNTAX
    New-Repo [[-RepoUrl] <String>] [[-UserName] <String>] [[-WorkingPath] <String>] [[-TargetFolder
    ] <String>] [<CommonParameters>]
    
    
DESCRIPTION
    This function will checkout the repository specified on the command line to a 
    folder on your hard-drive.
    

PARAMETERS
    -RepoUrl <String>
        The URL of your subversion repository
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -UserName <String>
        The username that you use to login to your repository
        
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -WorkingPath <String>
        The default is to use the current working directory, but you can specify an alternate
        location on the command-line
        
        Required?                    false
        Position?                    3
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -TargetFolder <String>
        The folder that will hold your repository
        
        Required?                    false
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
    
    
        This function checks to see what the value of $SubversionClient is before executing
        the update.
        Define $SubversionClient in your $profile, the two possible values I check are:
            svn, tortoise
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>New-Repo -RepoUrl https://code.patton-tech.com/repos/scripts -TargetFolder scripts -UserN
    ame repoman
    
    
    A    C:\repos\scripts\powershell
    A    C:\repos\scripts\powershell\playground
    A    C:\repos\scripts\powershell\playground\ScriptingGames
    A    C:\repos\scripts\powershell\playground\ScriptingGames\2011
    
    Description
    -----------
    The basic usage of the command.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/SubversionManagement#New-Repo



```
## Add-RepoItem ##
```

NAME
    Add-RepoItem
    
SYNOPSIS
    Add's a file to the repository
    
SYNTAX
    Add-RepoItem [-FileName] <String> [<CommonParameters>]
    
    
DESCRIPTION
    This function will add $FileName to the repository.
    

PARAMETERS
    -FileName <String>
        The filename and extension of the file to add to the repository
        
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
    
    
        This function checks to see what the value of $SubversionClient is before executing
        the update.
        Define $SubversionClient in your $profile, the two possible values I check are:
            svn, tortoise
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Add-RepoItem -FileName .\test.txt
    
    
    A         test.txt
    True
    
    Description
    -----------
    This example shows the basic usage of the command
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/SubversionManagement#Add-RepoItem



```
## Remove-RepoItem ##
```

NAME
    Remove-RepoItem
    
SYNOPSIS
    Removes a file from the repository
    
SYNTAX
    Remove-RepoItem [-FileName] <String> [<CommonParameters>]
    
    
DESCRIPTION
    This function will remove $FileName from the repository.
    

PARAMETERS
    -FileName <String>
        The filename and extension of the file to remove from the repository
        
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
    
    
        This function checks to see what the value of $SubversionClient is before executing
        the update.
        Define $SubversionClient in your $profile, the two possible values I check are:
            svn, tortoise
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Remove-RepoItem -FileName .\test.txt
    
    
    D         test.txt
    True
    
    Description
    -----------
    This example shows the basic usage of the command
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/SubversionManagement#Remove-RepoItem



```
## Set-RepoProps ##
```

NAME
    Set-RepoProps
    
SYNOPSIS
    Set properites for an item under revision control.
    
SYNTAX
    Set-RepoProps [[-PropSet] <String>] [-FileName] <String> [<CommonParameters>]
    
    
DESCRIPTION
    This function will allow you to set the properties for items under source control. The
    default PropSet sets the mime-type to text/plain.
    
    For a list of examples see: http://svnbook.red-bean.com/en/1.0/re23.html
    

PARAMETERS
    -PropSet <String>
        This is the svn property you wish to set on the item under revision control. For example
        to set a file's mime-type to be text you would pass in the following string.
            svn:mime-type 'text/plain'
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -FileName <String>
        The filename and extension of the file to remove from the repository
        
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
    
    
        This function checks to see what the value of $SubversionClient is before executing
        the update.
        Define $SubversionClient in your $profile, the two possible values I check are:
            svn, tortoise
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Set-RepoProps -FileName .\template.ps1
    
    
    property 'svn:mime-type' set on 'template.ps1'
    True
    
    Description
    -----------
    This example shows the basic usage of the command.
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    C:\PS>Set-RepoProps -PropSet "owner sally" -FileName .\template.ps1
    
    
    property 'owner' set on 'C:\repos\scripts\powershell\production\template.ps1'
    True
    
    Description
    -----------
    This example shows using the PropSet parameter to define the owner of a file.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/SubversionManagement#Set-RepoProps



```
## Commit-RepoItem ##
```

NAME
    Commit-RepoItem
    
SYNOPSIS
    Commit changes to the repository.
    
SYNTAX
    Commit-RepoItem [-FileName] <String> [-CommitMessage] <String> [<CommonParameters>]
    
    
DESCRIPTION
    This function commits recent changes to items under revision control to the repository.
    

PARAMETERS
    -FileName <String>
        The filename and extension of the file to remove from the repository
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -CommitMessage <String>
        This is the log message to pass in with the commit.
        
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
    
    
        This function checks to see what the value of $SubversionClient is before executing
        the update.
        Define $SubversionClient in your $profile, the two possible values I check are:
            svn, tortoise
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Commit-RepoItem -FileName .\template.ps1 -CommitMessage "Setting the mime-type to text/pl
    ain"
    
    
    Sending        template.ps1
    
    Committed revision 383.
    True
    
    Description
    -----------
    This example shows the default syntax of the command.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/SubversionManagement#Commit-RepoItem



```
## Get-SvnInfo ##
```

NAME
    Get-SvnInfo
    
SYNOPSIS
    Get information about the current repo
    
SYNTAX
    Get-SvnInfo [[-WorkingPath] <String>] [<CommonParameters>]
    
    
DESCRIPTION
    This function returns an objectified version of the svn info command.
    

PARAMETERS
    -WorkingPath <String>
        The default is to use the current working directory, but you can specify an alternate
        location on the command-line
        
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
    
    
        FunctionName : Get-SvnInfo
        Created by   : jspatton
        Date Coded   : 02/02/2012 16:22:28
        
        This function checks to see what the value of $SubversionClient is before executing
        the update.
        Define $SubversionClient in your $profile, the two possible values I check are:
            svn, tortoise
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>Get-SvnInfo
    
    
    RepositoryUUID    : eda1a4bd-5e7d-452c-8317-4a2619d6e488
    LastChangedDate   : 2012-01-20 11:32:21 -0600 (Fri, 20 Jan 2012)
    NodeKind          : directory
    LastChangedAuthor : jeffrey
    Revision          : 514
    LastChangedRev    : 514
    URL               : http://code.patton-tech.com/repos/scripts
    Schedule          : normal
    WorkingCopy       : C:\scripts
    RepositoryRoot    : http://code.patton-tech.com/repos/scripts
    Path              : .
    
    Description
    -----------
    This shows the basic syntax of the command. Here the command was run from within
    the checked out repository.
    
    
    
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    C:\PS>Get-SvnInfo -WorkingPath c:\patton
    
    
    RepositoryUUID    : 62335152-db53-1043-89ad-74d48cd9e3ba
    LastChangedDate   : 2012-01-23 17:02:11 -0600 (Mon, 23 Jan 2012)
    NodeKind          : directory
    LastChangedAuthor : jeffrey
    Revision          : 517
    LastChangedRev    : 517
    URL               : file:///C:/old
    Schedule          : normal
    WorkingCopy       : C:\patton
    RepositoryRoot    : file:///C:/old
    Path              : C:\patton
    
    Description
    -----------
    This shows the command being run from outside the checked out repository.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/SubversionManagement#Get-SvnInfo



```
## New-WikiPage ##
```

NAME
    New-WikiPage
    
SYNOPSIS
    Create a new wiki page from Get-Help
    
SYNTAX
    New-WikiPage [[-FileSpec] <Object>] [[-LibraryFile] <Object>] [[-WikiFile] <Object>] [<CommonPa
    rameters>]
    
    
DESCRIPTION
    This function reads a file that has functions with auto-help
    syntax inside is. It pulls out the function name and passes
    that to Get-Help -Full and sends the result to stdout.
    

PARAMETERS
    -FileSpec <Object>
        One or more PowerShell script files
        
        Required?                    false
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByValue)
        Accept wildcard characters?  
        
    -LibraryFile <Object>
        
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  
        
    -WikiFile <Object>
        
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
    
    
        FunctionName : New-WikiPage
        Created by   : Jeff Patton
        Date Coded   : 02/09/2012 09:12:10
    
    -------------------------- EXAMPLE 1 --------------------------
    
    C:\PS>New-WikiPage -FileSpec .\scripts
    
    
    Description
    -----------
    The basic syntax of the command.
    
    
    
    
    
    
RELATED LINKS
     https://code.google.com/p/mod-posh/wiki/SubversionManagement#New-WikiPage



```