# Demo Terraform - AWS infrastructure

This repository contains a demo AWS architecture which can be deployed using terraform.

## Infrastructure

This demo infrastructure has 5 components:

1. [AWS VPC](https://aws.amazon.com/vpc/)
2. [VPC Subnet](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html)
3. [VPC Security Group](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html)
4. [AWS EC2 Instance](https://aws.amazon.com/ec2/)
5. [AWS S3 bucket](https://aws.amazon.com/s3/)

The subnet is, by default, located inside the VPC. The EC2 instance is launced in the same subnet as described above with the created security group. The S3 bucket is a private S3 bucket which is just for demonstration.

The security group has no ingress or egress rules, and the EC2 instance is launched in a VPC, hence you can be assured that the infrastructure cannot be reached from the wide internet for security reasons.

## Usage

1. Run `terraform init`
```
terraform init
```
2. Run `terraform plan`
```
terraform plan
```
This will ask for the values of variables you need to enter to build the infrastructure. Many of the variables have some default values. If you need to input values to the `plan` step, have a look here: <https://www.terraform.io/docs/configuration/variables.html>

3. Run `terraform apply` to apply the changes
```
terraform apply
```

## References

1. [Terraform Documentation](https://www.terraform.io/docs/index.html)
2. [Terraform Getting Started Guide](https://www.terraform.io/intro/index.html)
3. [AWS Getting Started](https://www.terraform.io/intro/index.html)

## Warning
We do not take any responsibility whatsoever of the billing you will incur when deploying this architecture.