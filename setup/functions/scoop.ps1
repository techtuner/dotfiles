. "$PSSCriptRoot/show-progress.ps1"

function Install-Scoop {
    Write-Host "Installing Scoop"
    showProgress
    if (Get-Command scoop -ErrorAction SilentlyContinue) {
        Write-Host "Scoop is already installed. Updating Scoop"
        try {
            scoop update
            Write-Host "Scoop Updated successfully"
        }
        catch {
            Write-Warning "Failed to update Scoop: $_"
        
        }
    }
    else {
        Write-Host "Scoop not found. Installing Scoop..."
        try {
            iex "& {$(irm get.scoop.sh)} -RunAsAdmin"
            Write-Host "Scoop installed suucessfully"
        }
        catch {
            Write-Wartning "Failed to install Scoop: $_"
        }
    }
}

function Install-ScoopApps {
    $apps = @("gh", "neovim", "nodejs", "gcc", "gdb", "curl", "wget", "jq", "oh-my-posh", "fzf", "cmake", "python", "go", "bat", "ripgrep", "sudo")
    Write-Host "Installing Scoop Applications"
    showProgress
    foreach ($app in $apps) {
        $installed = scoop list $app 2>$null

        if ($installed) {
            Write-Host "$app is already installed. Atetmpting to update...."
            try {
                scoop update $app
                Write-Host "Updated $app"                
            }
            catch {
                Write-Warning "Failed to update $app : $_"
            }
        }
        else {
            Write-Host "$app is not installed. Installing...."
            try {
                scoop install $app
                Write-Host "Installed : $app"
            }
            catch {
                Write-Warning "Failed to install $app"
            }
        }
    }

}