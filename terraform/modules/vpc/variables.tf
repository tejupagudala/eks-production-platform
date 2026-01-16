
variable "name" {
  description = "VPC name"
  type        = string
}
variable "cidr" {
  description = "VPC CIDR block"
  type        = string
}
variable "azs" {
  description = "Availability Zones"
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
  description = "Enable NAT Gateway (true for prod, false for dev to save cost)"
  type        = bool
}