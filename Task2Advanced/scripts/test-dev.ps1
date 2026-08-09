$ErrorActionPreference = "Stop"

# Load .env
$envFile = Join-Path $PSScriptRoot "..\.env"
if (Test-Path $envFile) {
    Get-Content $envFile | ForEach-Object {
        if ($_ -match '^\s*([^#].+?)\s*=\s*(.+)\s*$') {
            [Environment]::SetEnvironmentVariable($matches[1], $matches[2], 'Process')
        }
    }
    Write-Host ".env loaded" -ForegroundColor Gray
}

# Go to dev directory
$devPath = Join-Path $PSScriptRoot "..\envs\dev"
Set-Location $devPath
Write-Host "Directory: $devPath" -ForegroundColor Gray

Write-Host "=== Init ===" -ForegroundColor Cyan
Remove-Item -Recurse -Force ".terraform", ".terraform.lock.hcl", "plan.tfplan" -ErrorAction SilentlyContinue
terraform init -backend-config="bucket=future2-terraform-state-dev" -backend-config="key=dev/terraform.tfstate"
if ($LASTEXITCODE -ne 0) { Write-Host "FAIL" -ForegroundColor Red; exit 1 }
Write-Host "Init OK" -ForegroundColor Green

Write-Host "=== Plan ===" -ForegroundColor Cyan
terraform plan -var-file="terraform.tfvars" -out="plan.tfplan"
if ($LASTEXITCODE -ne 0) { Write-Host "FAIL" -ForegroundColor Red; exit 1 }
Write-Host "Plan OK" -ForegroundColor Green

Write-Host "=== Apply ===" -ForegroundColor Cyan
terraform apply "plan.tfplan"
if ($LASTEXITCODE -ne 0) { Write-Host "FAIL" -ForegroundColor Red; exit 1 }
Write-Host "Apply OK" -ForegroundColor Green

Write-Host "=== Done ===" -ForegroundColor Green