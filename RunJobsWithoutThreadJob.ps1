# 実行回数を指定
$jobCount = 5

# 各ジョブのパラメータ
$columnCount = 50
$rowCount = 1000

# ベンチマーク開始
$sw = [System.Diagnostics.Stopwatch]::StartNew()

# 複数のジョブを実行
1..$jobCount | ForEach-Object {
    $outputFile = "random_data_$_.csv"
    & .\GenerateCSV.ps1 -outputFile $outputFile -columnCount $columnCount -rowCount $rowCount
}

# ベンチマーク終了
$sw.Stop()
Write-Host "ThreadJobを使用しない場合の実行時間: $($sw.Elapsed.TotalSeconds)秒"

# 生成された CSV ファイルを削除
1..$jobCount | ForEach-Object {
    $outputFile = "random_data_$_.csv"
    Remove-Item $outputFile -ErrorAction SilentlyContinue
}
