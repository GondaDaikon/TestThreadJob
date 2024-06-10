# デフォルトで提供されるモジュールの一覧を取得
$defaultModules = Get-Module -ListAvailable | Where-Object { $_.Name -ne $null } | Select-Object -ExpandProperty Name

# インポートされたモジュールの一覧を取得
$importedModules = Get-Module | Where-Object { $_.Name -ne $null } | Select-Object -ExpandProperty Name

# デフォルトで提供されるモジュールを除外して、インポートされたモジュールの一覧を表示
$customModules = $importedModules | Where-Object { $_ -notin $defaultModules }
$customModules
