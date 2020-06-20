Import-Module -Name "./scripts/get-test-project-location.psm1" -Verbose

$source = Get-Location;
$path = Get-TestProjectLocation;
Set-Location -Path $path;

# Add package for code coverage reporting
dotnet.exe tool install -g dotnet-reportgenerator-globaltool
dotnet.exe add package coverlet.msbuild

Set-Location $source.Path
