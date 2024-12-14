$RootDirectoryToCheck = 'C:\Path\To\InputFiles'
$DestinationDirectory = 'C:\Path\To\Found'

Import-Csv 'C:\Path\To\Names.csv' | ForEach-Object {
    $TextToFind = $_.YourFieldName

    foreach ($file in Get-ChildItem -Path $RootDirectoryToCheck -Filter '*.raf' -File -Recurse -OutVariable csvFiles) {
        Select-String $file -Pattern $TextToFind | Select-Object -Property Path, Line | Export-Csv 'C:\Path\To\results.csv' -Append
        Select-String $file -Pattern $TextToFind | Select-Object -Property Path, Line | Copy-Item -Destination $DestinationDirectory
    }
}
