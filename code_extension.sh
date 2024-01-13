#!/bin/bash

EXTENSIONS=(
"sumneko.lua"
"golang.go"
"miguelsolorio.fluent-icons"
"yzhang.markdown-all-in-one"
"christian-kohler.path-intellisense"
"ms-python.python"
"ms-python.black-formatter"
"aaron-bond.better-comments"
"rust-lang.rust-analyzer"
"ms-python.vscode-pylance"
"vadimcn.vscode-lldb"
"serayuzgur.crates"
"kisstkondoros.vscode-gutter-preview"
"usernamehw.errorlens"
"editorconfig.editorconfig"
"tamasfe.even-better-toml"
"ms-azuretools.vscode-docker"
"waderyan.gitblame"
"codezombiech.gitignore"
"rangav.vscode-thunder-client"
"bierner.markdown-preview-github-styles"
"catppuccin.catppuccin-vsc-icons"
"donjayamanne.githistory"
"marlosirapuan.nord-deep"
"nullxception.cherry-theme"
"drcika.apc-extension"
)

for extension in ${EXTENSIONS[@]}
do
    code --install-extension $extension
done
