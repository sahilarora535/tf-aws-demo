# -----------------------------------------------------------------------------
# Variables
# -----------------------------------------------------------------------------

variable "vpc_cidr_block" {
  description = "The CIDR block of the created VPC."
  default     = "10.0.0.0/16"
}

variable "aws_region" {
  description = "The region to deploy AWS resources into."
  default     = "us-east-1"
}

variable "ami" {
  description = "The AMI ID to deploy EC2 instance with."
  default     = "ami-0080e4c5bc078760e"
}

variable "instance_type" {
  description = "The EC2 instance type to be deployed."
  default     = "t2.micro"
}

variable "ssh_key_name" {
  description = "The name of the SSH keypair to login to the EC2 instance."
}

variable "s3_bucket_prefix" {
  description = "The prefix of the S3 bucket name"
  default     = "demo-s3-bucket"
}

# -----------------------------------------------------------------------------
# Resources
# -----------------------------------------------------------------------------

# Provider block
provider "aws" {
  region = "${var.aws_region}"
}

# 1. VPC
resource "aws_vpc" "demo_vpc" {
  cidr_block            = "${var.vpc_cidr_block}"
  enable_dns_hostnames  = true
  enable_dns_support    = true
}

# 2. Subnet
resource "aws_subnet" "demo_subnet" {
  cidr_block  = "${cidrsubnet(var.vpc_cidr_block, 4, 0)}"
  vpc_id      = "${aws_vpc.demo_vpc.id}"
}

# 3. Security group
resource "aws_security_group" "demo_sg" {
  vpc_id      = "${aws_vpc.demo_vpc.id}"
}

# 4. EC2 instance
resource "aws_instance" "demo_instance" {
  ami                     = "${var.ami}"
  instance_type           = "${var.instance_type}"
  vpc_security_group_ids  = [ "${aws_security_group.demo_sg.id}" ]
  subnet_id               = "${aws_subnet.demo_subnet.id}"
  key_name                = "${var.ssh_key_name}"
}

# 5. S3 bucket
resource "aws_s3_bucket" "demo_bucket" {
  bucket_prefix = "${var.s3_bucket_prefix}"
}
