variable "name" {
  description = "VPC name"
  type        = string
}

variable "cidr" {
  description = "VPC CIDR block"
  type        = string
}

variable "azs" {
  description = "Availability zones"
  type        = list(string)
}

variable "public_subnets" {
  description = "Public subnet CIDRs"
  type        = list(string)
}

variable "private_subnets" {
  description = "Private subnet CIDRs"
  type        = list(string)
}

variable "use_nat_gateway" {
  description = "Enable NAT Gateway (prod=true, dev=false)"
  type        = bool
}

variable "ssh_key_name" {
  description = "SSH key pair name for EKS worker nodes"
  type        = string
}

variable "cluster_version" {
  description = "EKS Kubernetes version"
  type        = string
}
