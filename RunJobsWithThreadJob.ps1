# ThreadJobモジュールのインポート
Import-Module ThreadJob

# 実行回数を指定
$jobCount = 5

# 各ジョブのパラメータ
$columnCount = 50
$rowCount = 1000

# ジョブを格納するリスト
$jobs = @()

# ベンチマーク開始
$sw = [System.Diagnostics.Stopwatch]::StartNew()

# 複数のジョブを開始
1..$jobCount | ForEach-Object {
    $outputFile = "random_data_$_.csv"
    $jobs += Start-ThreadJob -ScriptBlock {
        param (
            $outputFile, 
            $columnCount, 
            $rowCount
        )
        & .\GenerateCSV.ps1 -outputFile $outputFile -columnCount $columnCount -rowCount $rowCount
    } -ArgumentList $outputFile, $columnCount, $rowCount
}

# 全てのジョブが完了するのを待機
$jobs | ForEach-Object { $_ | Wait-Job; Receive-Job -Job $_; Remove-Job -Job $_ }

# ベンチマーク終了
$sw.Stop()
Write-Host "ThreadJobを使用した場合の実行時間: $($sw.Elapsed.TotalSeconds)秒"

# 生成された CSV ファイルを削除
1..$jobCount | ForEach-Object {
    $outputFile = "random_data_$_.csv"
    Remove-Item $outputFile -ErrorAction SilentlyContinue
}
