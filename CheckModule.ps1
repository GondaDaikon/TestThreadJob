# �f�t�H���g�Œ񋟂���郂�W���[���̈ꗗ���擾
$defaultModules = Get-Module -ListAvailable | Where-Object { $_.Name -ne $null } | Select-Object -ExpandProperty Name

# �C���|�[�g���ꂽ���W���[���̈ꗗ���擾
$importedModules = Get-Module | Where-Object { $_.Name -ne $null } | Select-Object -ExpandProperty Name

# �f�t�H���g�Œ񋟂���郂�W���[�������O���āA�C���|�[�g���ꂽ���W���[���̈ꗗ��\��
$customModules = $importedModules | Where-Object { $_ -notin $defaultModules }
$customModules
