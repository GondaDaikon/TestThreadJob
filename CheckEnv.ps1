$PSVersionTable

Write-Host "現在のディレクトリ: $pwd"

Get-ChildItem Env: | Sort-Object Name | Format-Table -AutoSize

Write-Host "このスクリプトの実行権限: $((Get-Item .\RunBenchmark.ps1).GetAccessControl().Access)"
