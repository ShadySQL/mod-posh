$Report = @()
$Servers = Get-ADObjects -ADSPath 'OU=Servers,DC=soecs,DC=ku,DC=edu'
foreach ($Server in $Servers)
{
    try
    {
        Write-Verbose "Make sure that $([string]$Server.Properties.name) is online"
        Test-Connection -ComputerName "$([string]$Server.Properties.name)" -Count 1 -ErrorAction Stop |out-null
        
        Write-Verbose "Get a list of all local disks for $([string]$Server.Properties.name), where the capacity is larger than 99Mb."
        $Volumes = Get-WmiObject -Class Win32_Volume -Filter 'DriveType=3' -ComputerName "$([string]$Server.Properties.name)" -ErrorAction Stop `
            -Credential $Credentials |Where-Object {$_.Capacity -gt 104853504}

        foreach ($Volume in $Volumes)
        {
            Write-Verbose "Check to see if $($Volume.Name) needs defragmented."
            $Dirty = $Volume.DefragAnalysis()
            $LineItem = New-Object -TypeName PSObject -Property @{
                ComputerName = [string]$Server.Properties.name
                Volume = $Volume.Name
                Capacity = $Volume.Capacity
                DefragRecommended = $Dirty.DefragRecommended
                }
            if ($Action)
            {
                Write-Verbose "The action flag is true"
                if ($Dirty.DefragRecommended -eq $true)
                {
                    Write-Verbose "$($Volume.Name) is being defragmented"
                    $Volume.Defrag()
                    }
                }
            }
        }
    catch
    {
        Write-Verbose "Caught an Exception"
        $LineItem = New-Object -TypeName PSObject -Property @{
            ComputerName = [string]$Server.Properties.name
            Volume = $Error[0].Exception
            Capacity = ""
            DefragRecommended = ""
            }
        }
    $Report += $LineItem
    }
