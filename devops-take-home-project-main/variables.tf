variable "aws_region" {
  description = "AWS region to use"
  type        = string
  default     = "us-west-1"
}

variable "aws_access_key" {
  description = "AWS Access Key ID for the target AWS account"
  type        = string
}

variable "aws_secret_key" {
  description = "AWS Secret Key for the target AWS account"
  type        = string
}

variable "aws_session_token" {
  description = "AWS Session Token for the target AWS account. Required only if authenticating using temporary credentials"
  type        = string
  default     = ""
}

variable "vpc_cidr" {
  description = "The IPv4 CIDR block to use for the VPC"
  type        = string
  default     = "192.170.0.0/20"
  validation {
    condition     = tonumber(split("/", var.vpc_cidr)[1]) <= 20 && tonumber(split("/", var.vpc_cidr)[1]) >= 16
    error_message = "CIDR size must be at least /20 and no larger than /16"
  }
}

variable "environment" {
  description = "The environment to which it needs to provision the resources"
  type        = string
  default     = "dev"
}

variable "public_subnets_cidr" {
    description = "Public CIDR ranges"
    default = ["192.170.0.0/24","192.170.1.0/24","192.170.2.0/24"]
}
variable "private_subnets_cidr" {
    description = "Private CIDR ranges"
    default = [ "192.170.3.0/24","192.170.4.0/24","192.170.5.0/24"]
}

variable "availability_zones" {
    description = "Availability Zones"
    default = [ "us-east-1a","us-east-1b","us-east-1c"]
}
