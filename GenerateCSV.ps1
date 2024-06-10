param (
    [string]$outputFile = "random_data.csv",
    [int]$columnCount = 50,
    [int]$rowCount = 1000
)

function New-RandomString {
    param (
        [int]$length
    )
    $chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
    $randomString = -join (1..$length | ForEach-Object { $chars[(Get-Random -Maximum $chars.Length)] })
    return $randomString
}

# カラム名を生成
$columns = (1..$columnCount | ForEach-Object { "Column$_" }) -join ','

# ヘッダー行を書き込む
Out-File -FilePath $outputFile -InputObject $columns -Encoding utf8

# データ行を書き込む
1..$rowCount | ForEach-Object {
    $row = (1..$columnCount | ForEach-Object { New-RandomString -length 10 }) -join ','
    Add-Content -Path $outputFile -Value $row
}

Write-Host "CSVファイルの作成が完了しました。ファイルパス: $outputFile"
