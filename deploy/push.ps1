$environment = $args[0]

$JSON = Get-Content -Path "C:\repo\PortfolioSite\deploy\properties.json" | ConvertFrom-JSON

$intString = $JSON.int
$prdString = $JSON.prd

Remove-Item C:\repo\PortfolioSite\public\* -Recurse -Force

If ($environment -eq 'prd') {
    cmd.exe /C '"C:\Program Files\R\R-4.0.2\bin\x64\Rscript.exe" build-prd.R'
} else {
    cmd.exe /C '"C:\Program Files\R\R-4.0.2\bin\x64\Rscript.exe" build-int.R'
}

Get-ChildItem  -Path c:\repo\PortfolioSite\public\*.html -recurse | ForEach { If (Get-Content $_.FullName | Select-String -Pattern '/figure-html//widgets/') 
           {(Get-Content $_ | ForEach {$_ -replace '/figure-html//widgets/', '/figure-html/widgets/'}) | Set-Content $_ }
           }


If ($environment -eq 'prd') {
    az storage blob sync -c '$web' -s "C:\repo\PortfolioSite\public" --connection-string $intString
} else {
    az storage blob sync -c '$web' -s "C:\repo\PortfolioSite\public" --connection-string $prdString
}

az cdn endpoint purge -g h3tech -n h3techdevCDN$environment --profile-name h3tech --content-paths '/*'