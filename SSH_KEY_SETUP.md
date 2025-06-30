# SSH Key Pair Setup for Inventory Manager

## Prerequisites

1. **AWS Account Access** - You need access to AWS Console
2. **OpenSSH** - For generating public key (comes with Git Bash or Windows 10+)

## Step 1: Create Key Pair in AWS Console

1. Go to AWS Console → EC2 → Key Pairs
2. Click "Create key pair"
3. Name: `inv-manager-key`
4. Key pair type: `RSA`
5. Private key file format: `PEM`
6. Click "Create key pair"
7. The file `inv-manager-key.pem` will download automatically

## Step 2: Place the Downloaded Key

1. Move the downloaded `inv-manager-key.pem` file to the `ssh/` directory
2. The file should be at: `ssh/inv-manager-key.pem`

## Step 3: Generate Public Key

### Option A: Using PowerShell Script (Recommended)
```powershell
.\generate_public_key.ps1
```

### Option B: Manual Command
```bash
ssh-keygen -y -f ssh/inv-manager-key.pem > ssh/inv-manager-key.pub
```

### Option C: Using Git Bash
```bash
ssh-keygen -y -f ssh/inv-manager-key.pem > ssh/inv-manager-key.pub
```

## Step 4: Verify Files

You should have these files:
- ✅ `ssh/inv-manager-key.pem` (private key - keep secure)
- ✅ `ssh/inv-manager-key.pub` (public key - used by Terraform)

## Step 5: Security

1. **Never commit the .pem file** - Add to `.gitignore`:
   ```
   ssh/*.pem
   ```

2. **Set proper permissions** (if on Linux/Mac):
   ```bash
   chmod 600 ssh/inv-manager-key.pem
   chmod 644 ssh/inv-manager-key.pub
   ```

## Step 6: Deploy

Now you can run Terraform:
```bash
terraform plan
terraform apply
```

## Troubleshooting

### "ssh-keygen not found"
- Install Git Bash or OpenSSH
- Use the PowerShell script instead

### "Permission denied"
- Make sure the .pem file has correct permissions
- Try running as administrator

### "File not found"
- Check that the .pem file is in the `ssh/` directory
- Verify the filename is exactly `inv-manager-key.pem` 