. "$PSScriptRoot/copy-config.ps1"
function Restart-TerminalComp {

  Write-Host "Restart Windows Terminal"
  foreach ($entry in $possiblePath) {
    Copy-Configuration
    $processName = $entry.Process

    $running = Get-Process -Name $processName -ErrorAction SilentlyContinue

    if ($running) {
      Stop-Process -Name $processName -Force -ErrorAction SilentlyContinue
      Start-Sleep -Seconds 2
      Start-Process $processName
    }
  }

  Write-Host "Restaring Computer for the changes to reflect."
  Start-Sleep -Seconds 10
  Restart-Computer

}
