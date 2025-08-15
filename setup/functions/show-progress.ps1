function showProgress {
for ($i = 0; $i -lt $5; $i++) {
    Write-Host "." -NoNewline
    Start-Sleep -Milliseconds 500
}
Write-Host ""
}