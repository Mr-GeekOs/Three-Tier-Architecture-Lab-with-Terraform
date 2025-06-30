# PowerShell script to generate public key from AWS key pair
# This script converts the downloaded .pem file to a .pub file

Write-Host "AWS Key Pair Public Key Generator" -ForegroundColor Green
Write-Host "=================================" -ForegroundColor Green

# Check if the private key file exists
$privateKeyPath = "ssh\inv-manager-key.pem"
$publicKeyPath = "ssh\inv-manager-key.pub"

if (-not (Test-Path $privateKeyPath)) {
    Write-Host "❌ Error: Private key file not found at $privateKeyPath" -ForegroundColor Red
    Write-Host "Please download your AWS key pair file and place it in the ssh/ directory" -ForegroundColor Yellow
    Write-Host "File should be named: inv-manager-key.pem" -ForegroundColor Yellow
    exit 1
}

Write-Host "✅ Found private key file: $privateKeyPath" -ForegroundColor Green

# Generate public key using ssh-keygen
try {
    Write-Host "Generating public key..." -ForegroundColor Yellow
    ssh-keygen -y -f $privateKeyPath > $publicKeyPath
    
    if (Test-Path $publicKeyPath) {
        Write-Host "✅ Public key generated successfully: $publicKeyPath" -ForegroundColor Green
        Write-Host "You can now run: terraform plan" -ForegroundColor Cyan
    } else {
        Write-Host "❌ Failed to generate public key" -ForegroundColor Red
    }
} catch {
    Write-Host "❌ Error generating public key: $_" -ForegroundColor Red
    Write-Host "Make sure you have OpenSSH installed or use Git Bash" -ForegroundColor Yellow
} 