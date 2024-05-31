[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

Import-Module posh-git
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

Set-PSReadLineOption -EditMode Vi
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteWord
Set-PSReadLineKeyHandler -Chord 'Ctrl+a' -Function BeginningOfLine

#Aliases
Set-Alias -Name vim -Value nvim
Set-Alias grep findstr
Set-Alias -Name cat -Value bat
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

# Custom functions
function which($command){
   Get-Command -Name $command -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function touch {Set-Content -Path ($args[0]) -Value ($null)}

function ghclone($username, $repo){
  if (Test-Path -Path $repo) {
    cd $repo
  }
  else {
    gh repo clone $username/$repo && cd $repo
  }
}

#oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\spaceship.omp.json" | Invoke-Expression
Invoke-Expression (&starship init powershell)
# $PSStyle.FileInfo.Directory = "`e[38;2;255;255;255m"
