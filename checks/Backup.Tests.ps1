$filename = $MyInvocation.MyCommand.Name.Replace(".Tests.ps1", "")

. "$PSScriptRoot/../internal/functions/Get-DatabaseInfo.ps1"

Describe "Last Backup Restore Test" -Tags TestLastBackup, $filename {
    if (-not (Get-DbcConfigValue skip.backup.testing)) {
        $destserver = Get-DbcConfigValue policy.backup.testserver
        $destdata = Get-DbcConfigValue policy.backup.datadir
        $destlog = Get-DbcConfigValue policy.backup.logdir
        @(Get-Instance).ForEach{
            Context "Testing Backup Restore & Integrity Checks on $psitem" {
            @(Test-DbaLastBackup -SqlInstance $psitem -Database ((Connect-DbaInstance -SqlInstance $psitem).Databases.Where{$_.CreateDate -lt (Get-Date).AddHours( - $graceperiod) -and ($ExcludedDatabases -notcontains $PsItem.Name)}).Name -VerifyOnly).ForEach{
                    
                    if ($psitem.DBCCResult -notmatch "skipped for restored master") {
                        It "DBCC for $($psitem.Database) on $($psitem.SourceServer) Should Be success" {
                            $psitem.DBCCResult | Should -Be "Success" -Because "You need to run DBCC CHECKDB to ensure your database is consistent"
                        }
                        It "restore for $($psitem.Database) on $($psitem.SourceServer) Should Be success" {
                            $psitem.RestoreResult | Should -Be "Success" -Because "The backup file has not successfully restored - you have no backup"
                        }
                    }
                }
            }
        }
    }
}

Describe "Last Backup VerifyOnly" -Tags TestLastBackupVerifyOnly, $filename {
    $graceperiod = Get-DbcConfigValue policy.backup.newdbgraceperiod
    @(Get-Instance).ForEach{
        Context "VerifyOnly tests of last backups on $psitem" {
            @(Test-DbaLastBackup -SqlInstance $psitem -Database ((Connect-DbaInstance -SqlInstance $psitem).Databases.Where{$_.CreateDate -lt (Get-Date).AddHours( - $graceperiod) -and ($ExcludedDatabases -notcontains $PsItem.Name)}).Name -VerifyOnly).ForEach{
                It "restore for $($psitem.Database) on $($psitem.SourceServer) Should be success" {
                    $psitem.RestoreResult | Should -Be "Success" -Because "The restore file has not successfully restored - you have no backup"
                }
                It "file exists for last backup of $($psitem.Database) on $($psitem.SourceServer)" {
                    $psitem.FileExists | Should -BeTrue -Because "Without a backup file you have no backup"
                }
            }
        }
    }
}
