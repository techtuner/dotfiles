#!/bin/bash

EXTENSIONS=(
"sumneko.lua"
"ritwickdey.liveserver"
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
"prisma.prisma"
"tamasfe.even-better-toml"
"nur.just-black"
"ms-azuretools.vscode-docker"
)

for extension in ${EXTENSIONS[@]}
do
    code --install-extension $extension
done