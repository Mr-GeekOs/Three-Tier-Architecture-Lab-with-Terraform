################################################################################
# Bastion Host for SSH Access to Private EC2 Instances
################################################################################

# Security Group for Bastion Host
module "bastion_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.1.0"

  name        = "inv-manager-bastion-sg"
  description = "Security group for bastion host"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      rule        = "ssh-tcp"
      cidr_blocks = "0.0.0.0/0"  # Consider restricting to your IP
      description = "SSH access from anywhere"
    }
  ]

  egress_rules = ["all-all"]

  tags = {
    Name        = "inv-manager-bastion-sg"
    created-by  = "terraform"
    Environment = "inv-manager"
  }
}

# Bastion Host
resource "aws_instance" "bastion" {
  ami                         = var.asg_image_id
  instance_type               = "t3.micro"
  key_name                    = aws_key_pair.ec2_key_pair.key_name
  vpc_security_group_ids      = [module.bastion_sg.security_group_id]
  subnet_id                   = module.vpc.public_subnets[0]  # Place in first public subnet
  associate_public_ip_address = true  # Ensure public IP is assigned

  tags = {
    Name        = "inv-manager-bastion"
    created-by  = "terraform"
    Environment = "inv-manager"
  }

  # Optional: Add user data for additional setup
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              EOF
}

# Associate Elastic IP with Bastion Host
resource "aws_eip_association" "bastion" {
  instance_id = aws_instance.bastion.id
  allocation_id = aws_eip.bastion.id
} 