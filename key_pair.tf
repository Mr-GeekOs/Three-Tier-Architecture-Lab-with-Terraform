################################################################################
# Key Pair for EC2 SSH Access
################################################################################

# Generate a new private key
resource "tls_private_key" "ec2_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create AWS key pair using the generated public key
resource "aws_key_pair" "ec2_key_pair" {
  key_name   = "inv-manager-key"
  public_key = tls_private_key.ec2_key.public_key_openssh
  
  tags = {
    Name        = "inv-manager-key"
    created-by  = "terraform"
    Environment = "inv-manager"
  }
}

# Save the private key locally for SSH access
resource "local_file" "private_key" {
  content  = tls_private_key.ec2_key.private_key_pem
  filename = "${path.module}/ssh/inv-manager-key.pem"
  file_permission = "0600"
}

# Save the public key locally
resource "local_file" "public_key" {
  content  = tls_private_key.ec2_key.public_key_openssh
  filename = "${path.module}/ssh/inv-manager-key.pub"
  file_permission = "0644"
} 