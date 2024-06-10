# 非同期処理のベンチマークプロジェクト

このプロジェクトは、PowerShell の非同期処理を使用して CSV ファイルの生成を行う際のベンチマークを実行するためのものです。

## 使用方法

1. このリポジトリをクローンします。
2. GenerateCSV.ps1 スクリプトを編集し、必要に応じてランダムな文字列の生成方法を変更します。
3. RunBenchmark.ps1 スクリプトを実行して、非同期処理のパフォーマンスをベンチマークします。

```powershell
.\RunBenchmark.ps1
```

## 実行例

```powershell
.\RunBenchmark.ps1
CSVファイルの作成が完了しました。ファイルパス: random_data_1.csv
CSVファイルの作成が完了しました。ファイルパス: random_data_2.csv
CSVファイルの作成が完了しました。ファイルパス: random_data_3.csv
CSVファイルの作成が完了しました。ファイルパス: random_data_4.csv
CSVファイルの作成が完了しました。ファイルパス: random_data_5.csv
ThreadJobを使用しない場合の実行時間: 148.4361911秒

Id     Name            PSJobTypeName   State         HasMoreData     Location             Command
--     ----            -------------   -----         -----------     --------             -------
16     Job16           ThreadJob       Completed     True            PowerShell           ...
CSVファイルの作成が完了しました。ファイルパス: random_data_1.csv
17     Job17           ThreadJob       Completed     True            PowerShell           ...
CSVファイルの作成が完了しました。ファイルパス: random_data_2.csv
18     Job18           ThreadJob       Completed     True            PowerShell           ...
CSVファイルの作成が完了しました。ファイルパス: random_data_3.csv
19     Job19           ThreadJob       Completed     True            PowerShell           ...
CSVファイルの作成が完了しました。ファイルパス: random_data_4.csv
20     Job20           ThreadJob       Completed     True            PowerShell           ...
CSVファイルの作成が完了しました。ファイルパス: random_data_5.csv
ThreadJobを使用した場合の実行時間: 38.977704秒
```
