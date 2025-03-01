function Process-CommandLineOptions {
    param([string[]]$args)

    # Initialize local options
    $createRepository = $false
    $repositoryDirectory = ""

    foreach ($arg in $args) {
	    Write-Output $arg
        if ($arg -match '^--dir=(.*)$') {
            $createRepository = $true
            $repositoryDirectory = $matches[1]
	}
    }


    if ($createRepository -and $repositoryDirectory) {
        # Change to the directory
        Set-Location -Path $repositoryDirectory

        # Git commands to initialize the repository
        Write-Output "Initializing the repository in $repositoryDirectory"
        git init
        echo "# $repositoryDirectory" >> README.md
        git add README.md
        git commit -m "Add Readme.md to repository"
        git branch -M main
        git remote add origin "https://github.com/onoma-anonymos/$repositoryDirectory.git"
        git push -u origin main
    
        } else {
            Write-Output "This script creates a folder and then initializes it as a GitHub Repository" 
            Write-Output "Usage: initRepo.ps1 --dir=<RepositoryFolderName>" 
        }
    }


Process-CommandLineOptions $args

