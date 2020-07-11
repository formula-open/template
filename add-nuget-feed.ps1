$defaultName = "formula-open"
$source = "https://nuget.pkg.github.com/formula-open/index.json"
$name = Read-Host "Name ($($defaultName))"
$username = Read-Host "Username"
$password = Read-Host "Personal Access Token" -AsSecureString

if ($name -eq "") {
	$name = $defaultName
}

dotnet nuget add source $source --name $name --username $username --password $password
