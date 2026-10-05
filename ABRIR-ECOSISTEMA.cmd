@echo off
set "GO_ECOSISTEMA=%~dp0"
powershell -NoProfile -Command "$taskRoot=Join-Path $env:GO_ECOSISTEMA 'panel de docentes'; $taskNode=(Get-Command node -ErrorAction Stop).Source; $ready=$false; try {$r=Invoke-WebRequest -Uri 'http://127.0.0.1:8765/' -TimeoutSec 2 -UseBasicParsing; $ready=($r.StatusCode -eq 200)}catch{}; if(-not $ready){Start-Process -FilePath $taskNode -ArgumentList @(('"'+(Join-Path $taskRoot 'preview.cjs')+'"'),'8765') -WorkingDirectory $taskRoot -WindowStyle Hidden}; Start-Process -FilePath (Join-Path $env:GO_ECOSISTEMA 'index.html')"
