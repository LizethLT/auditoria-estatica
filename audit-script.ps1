# audit-script.ps1
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host "Iniciando Auditoría Estática Automatizada (IEEE 1028)" -ForegroundColor Cyan
Write-Host "====================================================" -ForegroundColor Cyan

# Definir ruta del proyecto
$projectPath = "./DemoAuditApp/DemoAuditApp.csproj"

Write-Host "[1/2] Restaurando dependencias..." -ForegroundColor Yellow
dotnet restore $projectPath

Write-Host "[2/2] Ejecutando análisis estático y compilación estricta..." -ForegroundColor Yellow
# Compila tratando advertencias como errores gracias a la configuración del csproj
$buildOutput = dotnet build $projectPath --no-restore 2>&1

if ($LASTEXITCODE -ne 0) {
    Write-Host "`n[X] AUDITORÍA FALLIDA: Se detectaron violaciones de calidad, seguridad o formato." -ForegroundColor Red
    Write-Host "Revise los detalles del análisis arriba para subsanar los defectos." -ForegroundColor Red
    Exit 1
} else {
    Write-Host "`n[✔] AUDITORÍA EXITOSA: El código cumple con los estándares estipulados." -ForegroundColor Green
    Exit 0
}