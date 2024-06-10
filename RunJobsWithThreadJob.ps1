# ThreadJob���W���[���̃C���|�[�g
Import-Module ThreadJob

# ���s�񐔂��w��
$jobCount = 5

# �e�W���u�̃p�����[�^
$columnCount = 50
$rowCount = 1000

# �W���u���i�[���郊�X�g
$jobs = @()

# �x���`�}�[�N�J�n
$sw = [System.Diagnostics.Stopwatch]::StartNew()

# �����̃W���u���J�n
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

# �S�ẴW���u����������̂�ҋ@
$jobs | ForEach-Object { $_ | Wait-Job; Receive-Job -Job $_; Remove-Job -Job $_ }

# �x���`�}�[�N�I��
$sw.Stop()
Write-Host "ThreadJob���g�p�����ꍇ�̎��s����: $($sw.Elapsed.TotalSeconds)�b"

# �������ꂽ CSV �t�@�C�����폜
1..$jobCount | ForEach-Object {
    $outputFile = "random_data_$_.csv"
    Remove-Item $outputFile -ErrorAction SilentlyContinue
}
