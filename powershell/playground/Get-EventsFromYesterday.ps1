Function Get-EventsFromYesterday
{
    <#
        .SYNOPSIS
            Return a list of events that happened yesterday.
        .DESCRIPTION
            This function returns a collection of events from yesterday. 
        .PARAMETER EventLogs
            One or more valid names of Windows Logs
        .EXAMPLE
        .NOTES
        .LINK
    #>
    
    Param
        (
        [Parameter(ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        $EventLogs = (Get-WinEvent -ListLog * -ErrorAction SilentlyContinue |Where-Object {$_.RecordCount -gt 0 -AND ((Get-Date($_.LastWriteTime).Month) -eq (Get-Date).Month)})
        )
    $Events = @()
    foreach ($Log in $EventLogs)
    {
        foreach ($Entry in (Get-WinEvent -LogName $Log.LogName |Where-Object {$_.LevelDisplayName -ne "Information" -AND ((Get-Date($_.TimeCreated) -format "yyy-MM-dd") -eq (Get-Date((Get-Date).AddDays(-1)) -format "yyy-MM-dd"))}))
        {
            $ThisEvent = New-Object -TypeName PSObject -Property @{
                Message = $Entry.Message
                ActivityId = $Entry.ActivityId
                Bookmark = $Entry.Bookmark
                ContainerLog = $Entry.ContainerLog
                Id = $Entry.Id
                Keywords = $Entry.Keywords
                KeywordsDisplayNames = $Entry.KeywordsDisplayNames
                Level = $Entry.Level
                LevelDisplayName = $Entry.LevelDisplayname
                LogName = $Entry.LogName
                MachineName = $Entry.MachineName
                MatchedQueryIds = $Entry.MatchedQueryIds
                Opcode = $Entry.Opcode
                OpcodeDisplayName = $Entry.OpcodeDisplayName
                ProcessId = $Entry.ProcessId
                Properties = $Entry.Properties
                ProviderId = $Entry.ProviderId
                ProviderName = $Entry.ProviderName
                Qualifiers = $Entry.Qualifiers
                RecordId = $Entry.RecordId
                RelatedActivityId = $Entry.RelatedActivityId
                Task = $Entry.Task
                TaskDisplayName = $Entry.TaskDisplayName
                ThreadId = $Entry.ThreadId
                TimeCreated = $Entry.TimeCreated
                UserId = $Entry.UserId
                Version = $Entry.Version
                }
            $Events += $ThisEvent
        }
    }
    Return $Events
}