Import-Module -Name "./scripts/get-test-project-location.psm1" -Verbose

$source = Get-Location;
$path = Get-TestProjectLocation;
Set-Location -Path $path;

# Coverlet code coverage
dotnet.exe test /p:CollectCoverage=true /p:CoverletOutputFormat=opencover /p:Exclude="[xunit*]*"

# Code coverage reporting
reportgenerator.exe "-reports:coverage.opencover.xml" "-targetdir:coverage-reports" "-reporttypes:Html"

Set-Location $source.Path
