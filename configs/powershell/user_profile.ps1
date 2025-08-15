[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

Import-Module posh-git
Import-Module PSFzf
Import-Module Terminal-Icons

Set-PsFzfOption -PSReadlineChordProvider "Ctrl+f" -PSReadlineChordReverseHistory "Ctrl+r"

Set-PSReadLineOption -EditMode Vi
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteWord
Set-PSReadLineKeyHandler -Chord 'Ctrl+a' -Function BeginningOfLine

# Aliases
Set-Alias -Name vim -Value nvim
Set-Alias grep "findstr /i"
Set-Alias -Name cat -Value bat
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
Set-Alias workspace GoToWorkspace

# Custom Functions
function which($command){
    Get-Command =Name $command -ErrorAction SilentlyContinue | Select-Object -ExpandPropertyPath -ErrorAction SilentlyContinue
}

function touch {Set-Content -Path ($args[0]) -Value ($null)}

function ghclone {
param(
    [Parameter(Mandatory = $true, Position = 1)]
    [string]$Repository,

    [Parameter(Position = 0)]
    [string]$Username = "techtuner" # Default to techtuner if not provided
)
if (-not (gh auth status)) {
    Write-Host "Run 'gh auth login' to configure Github CLI"
}
if($PSCmdlet.MyInvocation.BoundParameters.Count -lt 1) {
    Write-Host "Usage: ghclone  <username>/<repository>"
    return 1
}

try {
    if (Test-Path -Path $Repository) {
        cd $Repository
    }
    else {
        gh repo clone $Username/$Repository && cd $Repository
    }
}
catch {
    Write-Host "Error: $($_.Exception.Message)"
}
}

function ghcreate {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Repository,

        [Parameter(Mandatory = $true)]
        [ValidateSet("public", "private")]
        [string]$Visibility,

        [string]$Username = "techtuner"  # Default to 'techtuner' if not provided
    )
    # Check if GitHub CLI is authenticated
    if (-not (gh auth status)) {
        Write-Host "Run 'gh auth login' to configure GitHub CLI"
    }

    if ($PSCmdlet.MyInvocation.BoundParameters.Count -lt 2) {
        Write-Host "Usage: ghcreate <repository> <visibility> [<username>]"
        return 1
    }

    try {
        # Create the repository on GitHub
        gh repo create $Repository --$Visibility

        # Clone the repository
        gh repo clone "$Username/$Repository" && cd $Repository

    } catch {
        Write-Host "Error: $($_.Exception.Message)"
    }

}

function GoToWorkspace {
  Set-Location ~/workspace/
}

oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\robbyrussell.omp.json" | Invoke-Expression
# Invoke-Expression (&starship init powershell)
$PSStyle.FileInfo.Directory = "`e[38;2;255;255;255m"

