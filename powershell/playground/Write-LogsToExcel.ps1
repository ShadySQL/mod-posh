$Excel = New-Object -comobject Excel.Application
$Book = $Excel.Workbooks.Add()
$Sheet1 = $Excel.Worksheets.Item(1)

#$Log = Get-WinEvent -LogName "Directory Service" -ComputerName dc1 -Credential $Credentials `
#        |Where-Object {$_.LevelDisplayName -ne "Information" `
#        -AND $_.TimeCreated -gt (Get-Date).AddDays(-1).Date -AND $_.TimeCreated -le (Get-Date).Date}

#$Log = $Log |Select-Object -Property Id, ProviderName, LogName, ProcessID, ThreadID, UserID, TimeCreated, LevelDisplayName, TaskDisplayName, Message

$Sheet1.cells.item(1,1) = "Id"
$Sheet1.cells.item(1,2) = "ProviderName"
$Sheet1.cells.item(1,3) = "LogName"
$Sheet1.cells.item(1,4) = "ProcessID"
$Sheet1.cells.item(1,5) = "ThreadID"
$Sheet1.cells.item(1,6) = "UserID"
$Sheet1.cells.item(1,7) = "TimeCreated"
$Sheet1.cells.item(1,8) = "LevelDisplayName"
$Sheet1.cells.item(1,9) = "TaskDisplayName"
$Sheet1.cells.item(1,10) = "Message"

$Sheet1.Name = "DC - "+$entry.LogName

$row = 2
foreach($entry in $log)
    {
        $Sheet1.cells.item($row,1) = [string]$entry.Id
        $Sheet1.cells.item($row,2) = [string]$entry.ProviderName
        $Sheet1.cells.item($row,3) = [string]$entry.LogName
        $Sheet1.cells.item($row,4) = [int]$entry.ProcessID
        $Sheet1.cells.item($row,5) = [int]$entry.ThreadID
        $Sheet1.cells.item($row,6) = [string]$entry.UserID
        $Sheet1.cells.item($row,7) = [datetime]$entry.TimeCreated
        $Sheet1.cells.item($row,8) = [string]$entry.LevelDisplayName
        $Sheet1.cells.item($row,9) = [string]$entry.TaskDisplayName
        $Sheet1.cells.item($row,10) = [string]($entry.Message).Replace("`n","")
        
        $row++
        }
$Excel.Visible = $True