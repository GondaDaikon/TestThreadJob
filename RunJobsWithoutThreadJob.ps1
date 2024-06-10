# ���s�񐔂��w��
$jobCount = 5

# �e�W���u�̃p�����[�^
$columnCount = 50
$rowCount = 1000

# �x���`�}�[�N�J�n
$sw = [System.Diagnostics.Stopwatch]::StartNew()

# �����̃W���u�����s
1..$jobCount | ForEach-Object {
    $outputFile = "random_data_$_.csv"
    & .\GenerateCSV.ps1 -outputFile $outputFile -columnCount $columnCount -rowCount $rowCount
}

# �x���`�}�[�N�I��
$sw.Stop()
Write-Host "ThreadJob���g�p���Ȃ��ꍇ�̎��s����: $($sw.Elapsed.TotalSeconds)�b"

# �������ꂽ CSV �t�@�C�����폜
1..$jobCount | ForEach-Object {
    $outputFile = "random_data_$_.csv"
    Remove-Item $outputFile -ErrorAction SilentlyContinue
}
