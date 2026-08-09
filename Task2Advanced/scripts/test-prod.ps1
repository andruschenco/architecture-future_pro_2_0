$ErrorActionPreference = "Stop"

# Load .env
$envFile = Join-Path $PSScriptRoot "..\.env"
if (Test-Path $envFile) {
    Get-Content $envFile | ForEach-Object {
        if ($_ -match '^\s*([^#].+?)\s*=\s*(.+)\s*$') {
            [Environment]::SetEnvironmentVariable($matches[1], $matches[2], 'Process')
        }
    }
}

Set-Location (Join-Path $PSScriptRoot "..\envs\prod")

Write-Host "=== Init ===" -ForegroundColor Cyan
Remove-Item -Recurse -Force ".terraform", ".terraform.lock.hcl", "plan.tfplan" -ErrorAction SilentlyContinue
terraform init -backend-config="bucket=future2-terraform-state-prod" -backend-config="key=prod/terraform.tfstate"
if ($LASTEXITCODE -ne 0) { Write-Host "FAIL" -ForegroundColor Red; exit 1 }

Write-Host "=== Plan ===" -ForegroundColor Cyan
terraform plan -var-file="terraform.tfvars" -out="plan.tfplan"
if ($LASTEXITCODE -ne 0) { Write-Host "FAIL" -ForegroundColor Red; exit 1 }

Write-Host "=== Apply ===" -ForegroundColor Cyan
terraform apply "plan.tfplan"
if ($LASTEXITCODE -ne 0) { Write-Host "FAIL" -ForegroundColor Red; exit 1 }

Write-Host "=== Done ===" -ForegroundColor Green