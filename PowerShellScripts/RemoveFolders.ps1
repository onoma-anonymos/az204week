param (
    [string]$FolderPath
)

if (Test-Path -Path $FolderPath) {
    try {
        Remove-Item -Path $FolderPath -Recurse -Force
        Write-Host "Folder '$FolderPath' has been successfully removed."
    } catch {
        Write-Error "An error occurred while removing the folder: $_"
    }
} else {
    Write-Host "The specified folder path '$FolderPath' does not exist."
}
