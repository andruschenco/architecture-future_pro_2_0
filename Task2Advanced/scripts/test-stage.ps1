$ErrorActionPreference = "Stop"
Set-Location (Join-Path $PSScriptRoot "..\envs\stage")

Write-Host "=== Init ===" -ForegroundColor Cyan
Remove-Item -Recurse -Force ".terraform", ".terraform.lock.hcl", "plan.tfplan" -ErrorAction SilentlyContinue
terraform init -backend-config="bucket=future2-terraform-state-stage" -backend-config="key=stage/terraform.tfstate"
if ($LASTEXITCODE -ne 0) { Write-Host "FAIL" -ForegroundColor Red; exit 1 }

Write-Host "=== Plan ===" -ForegroundColor Cyan
terraform plan -var-file="terraform.tfvars" -out="plan.tfplan"
if ($LASTEXITCODE -ne 0) { Write-Host "FAIL" -ForegroundColor Red; exit 1 }

Write-Host "=== Apply ===" -ForegroundColor Cyan
terraform apply "plan.tfplan"
if ($LASTEXITCODE -ne 0) { Write-Host "FAIL" -ForegroundColor Red; exit 1 }

Write-Host "DONE" -ForegroundColor Green