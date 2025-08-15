function Install-PowershellModules {
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

    $modules = @("PSReadLine", "posh-git", "PSFzf", "Terminal-Icons", "PowerShellGet", "Microsoft.Graph")

    Write-Host "Registering PSGallery as trusted source..."
    if (-not (Get-PSRepository | Where-Object { $_.Name -eq "PSGallery" -and $_.InstallationPolicy -eq "Trusted" })) {
        Set-PSRepository -Name "PSGallery" -InstallationPolicy Trusted -ErrorAction Stop
    }

    Write-Host "Installing PowerShell modules..."
    showProgress

    foreach ($module in $modules) {
        if (-not (Get-Module -ListAvailable -Name $module)) {
            try {
                Install-Module -Name $module -Scope CurrentUser -Force -AllowClobber -ErrorAction Stop
                Write-Host "Installed Module: $module"
            }
            catch {
                Write-Warning "Failed to install $module : $_"
            }
        }
        else {
            Write-Host "$module already installed..."
        }
    }
}