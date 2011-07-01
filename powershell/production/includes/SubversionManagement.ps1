Function Get-SubversionInfo
{
    <#
        .SYNOPSIS
            Return the version of subversion client installed.
        .DESCRIPTION
            This script will return the name of the installed subversion client.
        .EXAMPLE
            Get-SubversionInfo
        .NOTES
            I'm currently only checking for Collabnet Subversion client. This
            function I think is really only useful for my Subversion library.
        .LINK
            
    #>
    
    Begin
    {
        
        }

    Process
    {
        $Name = Get-WmiObject -Class Win32_Product -Filter "Name LIKE '%svn%' OR Name LIKE '%subversion%'"
        }

    End
    {
        Return $Name
        }
}
Function Set-SubversionPreference
{
    <#
        .SYNOPSIS
            Set which subversion client to use
        .DESCRIPTION
            This function will write a file to the user profile with either Collab or Tortoise
            to note which version of the client software you wish to use.
    #>
    
    Param
    (
    )
    
    Begin
    {
        }

    Process
    {
        }

    End
    {
        }
}
Function Update-Repo
{
    <#
        .SYNOPSIS
        .DESCRIPTION
        .PARAMETER
        .EXAMPLE
        .NOTES
        .LINK
    #>
    
    Param
    (
    [string]$WorkingPath
    )
    
    Begin
    {
        $TSvnCommand = "TortoiseProc.exe /command:update /path:$($WorkingPath)"
        $SvnCommand = "svn update $($WorkingPath)"
        }

    Process
    {
        
        }

    End
    {
        
        }
}

Function New-Repo
{
    <#
        .SYNOPSIS
        .DESCRIPTION
        .PARAMETER
        .EXAMPLE
        .NOTES
        .LINK
    #>
    
    Param
    (
    )
    
    Begin
    {
        
        }

    Process
    {
        
        }

    End
    {
        
        }
}

Function Add-RepoItem
{
    <#
        .SYNOPSIS
        .DESCRIPTION
        .PARAMETER
        .EXAMPLE
        .NOTES
        .LINK
    #>
    
    Param
    (
    )
    
    Begin
    {
        
        }

    Process
    {
        
        }

    End
    {
        
        }
}

Function Set-RepoProps
{
    <#
        .SYNOPSIS
        .DESCRIPTION
        .PARAMETER
        .EXAMPLE
        .NOTES
        .LINK
    #>
    
    Param
    (
    )
    
    Begin
    {
        
        }

    Process
    {
        
        }

    End
    {
        
        }
}

New-RepoRevision
{
    <#
        .SYNOPSIS
        .DESCRIPTION
        .PARAMETER
        .EXAMPLE
        .NOTES
        .LINK
    #>
    
    Param
    (
    )
    
    Begin
    {
        
        }

    Process
    {
        
        }

    End
    {
        
        }
}