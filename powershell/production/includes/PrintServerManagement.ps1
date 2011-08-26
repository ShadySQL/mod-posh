Function Get-Printers
{
    <#
    .Synopsis
        Get a list of printers from the specified print server
    .Description
        This function returns the Name of each printer installed
        on the specified print server.
    .Example
        Get-Printers -ComputerName ps
    #>
    Param
    (
        [String]$ComputerName
    )
    Begin
    {
        $Host.Runspace.ThreadOptions = "ReuseThread"
        $ErrorActionPreference = "Stop"
        Try
        {
            Add-Type -AssemblyName System.Printing
            $PrintServer = New-Object System.Printing.PrintServer("\\$($ComputerName)")
            $PrintQueues = $PrintServer.GetPrintQueues()
            }
        Catch
        {
            Write-Error $Error[0].Exception
            Break
            }
        $Printers = @()
        }
    Process
    {
        Foreach ($PrintQueue in $PrintQueues)
        {
            $ThisPrinter = New-Object -TypeName PSObject -Property @{
                Name = $PrintQueue.Name
                }
            $Printers += $ThisPrinter
            }
        }
    End
    {
        Return $Printers
        }
}
Function Get-PrintQueue
{
    <#
    .Synopsis
        Return the print queue for a given printer
    .Description
        This function returns the print queue for a specific printer 
        from the print server.
    .Example
        Get-PrintQueue -ComputerName ps -Name HPCLJ5500
    #>
    Param
    (
        $ComputerName,
        $Name
    )
    Begin
    {
        $Host.Runspace.ThreadOptions = "ReuseThread"
        $ErrorActionPreference = "Stop"
        Try
        {
            Add-Type -AssemblyName System.Printing
            $PrintServer = New-Object System.Printing.PrintServer("\\$($ComputerName)")
            $PrintQueue = $PrintServer.GetPrintQueue($Name)
            }
        Catch
        {
            Write-Error $Error[0].Exception
            Break
            }
        }
    Process
    {
        }
    End
    {
        Return $PrintQueue
        }
}
Function Get-PrintJobs
{
    <#
    .Synopsis
        A Quick Description of what the command does
    .Description
        A Detailed Description of what the command does
    .Example
        An example of using the command        
    #>
    Param
    (
        $ComputerName,
        $Name
    )
    Begin
    {
        $Host.Runspace.ThreadOptions = "ReuseThread"
        $ErrorActionPreference = "Stop"
        Try
        {
            Add-Type -AssemblyName System.Printing
            $PrintServer = New-Object System.Printing.PrintServer("\\$($ComputerName)")
            $PrintQueue = $PrintServer.GetPrintQueue($Name)
            $PrintJobs = $PrintQueue.GetPrintJobInfoCollection()
            }
        Catch
        {
            Write-Error $Error[0].Exception
            Break
            }
        }
    Process
    {
        }
    End
    {
        Return $PrintJobs
        }
}