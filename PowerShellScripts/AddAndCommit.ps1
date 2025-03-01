param (
    [string]$CommitMessage
)

try {
    # Navigate to the git repository directory if needed
    # Set-Location "C:\Path\To\Your\Repo"
    Set-Location ".\"

    # Stage all changes
    git add -A 

    # Commit changes with the provided message
    git commit -m $CommitMessage

    Write-Host "Changes have been committed with message: '$CommitMessage'"
} catch {
    Write-Error "An error occurred: $_"
}

