param (
    [string]$Format = "yyyy-MM-dd_HH-mm-ss"
)

try {
    # Navigate to the git repository directory if needed
    # Set-Location "C:\Path\To\Your\Repo"

    # Get the current date and time in the specified format
    $StashMessage = (Get-Date).ToString($Format)

    # Stage all changes
    git add -A

    # Create a stash with the date and time as the message
    git stash push -m $StashMessage

    Write-Host "Changes have been stashed with message: '$StashMessage'"

    # Apply the most recent stash without removing it
    git stash apply

    Write-Host "The most recent stash has been applied."
} catch {
    Write-Error "An error occurred: $_"
}

