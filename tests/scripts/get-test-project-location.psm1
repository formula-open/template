function Get-TestProjectLocation() {
	$paths = New-Object System.Collections.Generic.List[string];
	$index = 0;

	# Get test projects in 'tests' directory
	Get-ChildItem -Filter *.csproj -Recurse | ForEach-Object {
		$index++;
		Write-Host "$($index) - $($_.Name)";
		$paths.Add($_.Directory);
	}

	$selected = Read-Host;
	$parsed = 0;

	# User input validation
	if (![Int32]::TryParse($selected, [ref]$parsed)) {
		Write-Host "Input is not a valid number.";
		exit;
	}
	
	return $paths[$parsed - 1];
}
