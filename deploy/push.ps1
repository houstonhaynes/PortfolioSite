Param
    (
        [Parameter(Mandatory=$TRUE)]   
        [ValidateNotNull()]
        [ValidateNotNullOrEmpty()]        
        [ValidateSet("int","prd")] 
        [string]$environment,
        [Parameter(Mandatory=$FALSE)]   
        [ValidateSet("Rmd")]
        [string]$build
    )

# get connection strings from local file
$JSON = Get-Content -Path "C:\repo\PortfolioSite\deploy\properties.json" | ConvertFrom-JSON

# populate connection strings for each environment
If ($environment -eq 'prd') {
    $prdString = $JSON.prd
} else {
    $intString = $JSON.int
}

# clear the files to ensure that a 'clean' build is generated for all files
Remove-Item C:\repo\PortfolioSite\public\* -Recurse -Force


If ($build -eq 'Rmd') {
    Remove-Item C:\repo\PortfolioSite\content\post\*.html -Recurse -Force
    cmd.exe /C '"C:\Program Files\R\R-4.1.1\bin\x64\Rscript.exe" build-site.R'
}


# run R terminal to build blogdown site for specific URL pattern
If ($environment -eq 'prd') {
    cmd.exe /C '"C:\Program Files\R\R-4.1.1\bin\x64\Rscript.exe" build-prd.R'
} else {
    cmd.exe /C '"C:\Program Files\R\R-4.1.1\bin\x64\Rscript.exe" build-int.R'
}

Get-ChildItem  -Path c:\repo\PortfolioSite\public\*.html -recurse | ForEach-Object { If (Get-Content $_.FullName | Select-String -Pattern '/figure-html//widgets/') 
           {(Get-Content $_ | ForEach-Object {$_ -replace '/figure-html//widgets/', '/figure-html/widgets/'}) | Set-Content $_ }
           }

# do the file push using azcopy sync function
If ($environment -eq 'prd') {
    az storage blob sync -c '$web' -s "C:\repo\PortfolioSite\public" --connection-string $prdString
} else {
    az storage blob sync -c '$web' -s "C:\repo\PortfolioSite\public" --connection-string $intString
}
    
az cdn endpoint purge -g h3tech -n h3techdevCDN$environment --profile-name h3tech --content-paths '/*'
