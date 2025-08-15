function Install-VScodeExtensions {
    Write-Host "Installing Visual Studio Extension"
    $extensions = @(
        "formulahendry.auto-close-tag"
        "formulahendry.auto-rename-tag"
        "formulahendry.auto-complete-tag"
        "aaron-bond.better-comments"
        "antfu.icons-carbon"
        "formulahendry.code-runner"
        "vadimcn.vscode-lldb"
        "naumovs.color-highlight"
        "ms-azuretools.vscode-docker"
        "editorconfig.editorconfig"
        "usernamehw.errorlens"
        "dsznajder.es7-react-js-snippets"
        "dbaeumer.vscode-eslint"
        "golang.go"
        "kisstkondoros.vscode-gutter-preview"
        "yzhang.markdown-all-in-one"
        "pkief.material-icon-theme"
        "christian-kohler.npm-intellisense"
        "christian-kohler.path-intellisense"
        "ms-vscode.powershell"
        "esbenp.prettier-vscode"
        "ms-python.python"
        "rust-lang.rust-analyzer"
        "redhat.vscode-yaml"
        "twxs.cmake"
        "reiisen.hi"
        "sumneko.lua"
"Catppuccin.catppuccin-vsc"
"Catppuccin.catppuccin-vsc-icons"

    )

    Write-Host "Installing VS Code Extensions..."
    foreach ($extension in $extensions) {
        try {
            code --install-extension $extension --force
            Write-Host "Installed: $extension"
        }
        catch {
            Write-Warning "Failed to install the $extension : $_"
        } 
    }
}

