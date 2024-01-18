#!/bin/bash

EXTENSIONS=(
"rust-lang.rust-analyzer"
    "artdiniz.quitcontrol-vscode"
    "ms-python.python"
    "ms-python.vscode-pylance"
    "esbenp.prettier-vscode"
    "ms-vscode.powershell"
    "christian-kohler.path-intellisense"
    "yzhang.markdown-all-in-one"
    "sumneko.lua"
    "kisstkondoros.vscode-gutter-preview"
    "jdinhlife.gruvbox"
    "golang.go"
    "miguelsolorio.fluent-icons"
    "tamasfe.even-better-toml"
    "usernamehw.errorlens"
    "ms-azuretools.vscode-docker"
    "serayuzgur.crates"
    "naumovs.color-highlight"
    "vadimcn.vscode-lldb"
    "catppuccin.catppuccin-vsc-icons"
    "aaron-bond.better-comments"
    "drcika.apc-extension"
)

for extension in ${EXTENSIONS[@]}
do
    code --install-extension $extension
done
