#!/bin/bash

EXTENSIONS=(
"sumneko.lua"
"golang.go"
"miguelsolorio.fluent-icons"
"miguelsolorio.symbols"
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
"antfu.theme-vitesse"
"peymanslh.blueberry-dark-theme"
"ms-azuretools.vscode-docker"
"waderyan.gitblame"
"auiworks.amvim"
"BeardedBear.beardedtheme"
"codezombiech.gitignore"
"rangav.vscode-thunder-client"
"bierner.markdown-preview-github-styles"
"donjayamanne.githistory"
)

for extension in ${EXTENSIONS[@]}
do
    code --install-extension $extension
done