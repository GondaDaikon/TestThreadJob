$PSVersionTable

Write-Host "���݂̃f�B���N�g��: $pwd"

Get-ChildItem Env: | Sort-Object Name | Format-Table -AutoSize

Write-Host "���̃X�N���v�g�̎��s����: $((Get-Item .\RunBenchmark.ps1).GetAccessControl().Access)"
