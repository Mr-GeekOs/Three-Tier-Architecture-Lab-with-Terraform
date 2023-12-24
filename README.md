Three-Tier Architecture Lab with Terraform

This repository contains Terraform code to set up a three-tier architecture on AWS. The architecture includes the following components:
Components:

    Virtual Private Cloud (VPC):
        Creates a dedicated virtual network for the resources.
    Availability Zones (AZ):
        Spans the architecture across multiple availability zones for high availability.
    Public and Private Subnets:
        Defines subnets within the VPC, separating public-facing and private resources.
    Amazon RDS (Relational Database Service):
        Sets up a managed relational database for application data.
    Application Load Balancer (ALB):
        Directs incoming web traffic to multiple instances for high availability and scalability.
    NAT Gateway:
        Provides outbound internet access for instances in private subnets.
    Auto Scaling Group:
        Scales instances automatically based on demand.
    phpMyAdmin Application:
        Deploys a web-based MySQL database management tool for easy administration.

Prerequisites:

    AWS Account:
        Access to an AWS account with necessary permissions to create resources.

    Terraform:
        Ensure Terraform is installed on your local machine to deploy the infrastructure.

Usage:

    Configuration:
        Update variables.tf with your desired configuration values.

    Deployment:
        Run terraform init to initialize the project.
        Execute terraform plan to review the execution plan.
        Run terraform apply to create the architecture.

    Access phpMyAdmin:
        Retrieve the ALB URL to access phpMyAdmin and manage the RDS instance.

Important Notes:

    Costs:
        Be cautious about the costs associated with running resources on AWS.
    Security:
        Always follow AWS best practices for security configurations.
    Monitoring and Logging:
        Implement proper monitoring and logging for the deployed resources.

Contributions:

Contributions and improvements to this lab setup are welcome! Feel free to fork the repository, make changes, and submit pull requests to enhance the architecture or documentation.