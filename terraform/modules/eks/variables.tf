
variable "cluster_name" {
    description = "Name of the EKS cluster"
    type = string
}

variable "vpc_id" {
    description = "VPC ID where the EKS will be deployed"
    type = string
}

variable "subnet_ids" {
    description = "private subnet ids for EKS nodes"
    type = list(string)
}

variable "node_instance_types" {
    description = ""
    type = list(string)
    default = ["t3.micro"]
}

variable "ssh_key_name" {
    description = "SSH key pair name for EC2 node access"
    type = string
}

variable "admin_role_name" {
  description = "Optional override for platform admin role name"
  type        = string
  default     = null
}

variable "cluster_version" {
  description = "EKS Kubernetes version, e.g. 1.29"
  type        = string
}