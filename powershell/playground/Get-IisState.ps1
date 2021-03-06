Function Get-IisState
{
    <#
        .SYNOPSIS
        .DESCRIPTION
        .PARAMETER
        .EXAMPLE
        .NOTES
            FunctionName : Get-IisState
            Created by   : jspatton
            Date Coded   : 06/08/2012 13:18:02
        .LINK
            https://code.google.com/p/mod-posh/wiki/Untitled2#Get-IisState
    #>
    [CmdletBinding()]
    Param
        (
        [Parameter(Mandatory=$True,ValueFromPipeline=$True,ValueFromPipelinebyPropertyName=$True)]
        [string]$ComputerName
        )
    Begin
    {
        }
    Process
    {
        foreach ($Computer in $ComputerName)
        {
            try
            {
                $State = (Get-WmiObject -Class Win32_Service -ComputerName $Computer -Filter "Name='w3svc'" -ErrorAction Stop).State
                if ($State -eq 'Running')
                {
                    $Status = $State
                    }
                else
                {
                    $Status = 'Not Running'
                    }
                New-Object -TypeName PSObject -Property @{
                    ComputerName = $Computer
                    IIS = $Status
                    }
                }
            catch
            {
                New-Object -TypeName PSObject -Property @{
                    ComputerName = $Computer
                    IIS = 'Not Found'
                    }
                }
            }
        }
    End
    {
        }
    }