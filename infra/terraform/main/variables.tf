variable "region" {
  type    = string
  description = "Which zone you want to deploy"
  default = ""
}

variable "environment" {
  type        = string
  description = "Environment"
  default     = ""
}

### AUTOSCALING GROUP

variable "instance-name" {
  type        = string
  description = "Name of Instance prefix"
  default     = ""
}

variable "ami" {
  type        = string
  description = "Can be imported using the ID of the AMI"
  default     = ""
}

variable "instance_type" {
  type        = string
  description = "Instance type e.g. t2.micro"
  default     = ""
}

variable "monitoring" {
  type        = string
  description = "Enable the basic monitoring"
  default     = ""
}

variable "desired_capacity" {
  type        = string
  description = "The amount of EC2 Instances desired"
  default     = ""
}

variable "min_size" {
  type        = string
  description = "The minimum Instances desired"
  default     = ""
}

variable "max_size" {
  type        = string
  description = "The minimum Instances desired"
  default     = ""
}

variable "termination_policies" {
  type        = string
  description = "Which order should ASG terminate yours instaces"
  default     = ""
}

variable "wait_for_elb_capacity" {
  type        = string
  description = "Terraform to wait for exactly this number of healthy instances from this Auto Scaling Group"
  default     = ""
}

### STORAGE

variable "volume_size" {
  type        = string
  description = "Size of the volume in gibibytes (GiB)"
  default     = ""
}

variable "volume_type" {
  type        = string
  description = "Type of volume. Valid values include standard, gp2, gp3, io1, io2, sc1, or st1"
  default     = ""
}

variable "encrypted" {
  type        = string
  description = "Whether to enable volume encryption"
  default     = ""
}

### NETWORK

variable "vpc_id" {
  type        = string
  description = "VPC ID"
  default     = ""
}

variable "subnetid_aza" {
  type        = string
  description = "Subnet A"
  default     = ""
}

variable "subnetid_azb" {
  type        = string
  description = "Subnet B"
  default     = ""
}

variable "subnetid_azc" {
  type        = string
  description = "Subnet C"
  default     = ""
}

variable "load_balancer_arn" {
  type        = string
  description = "ARN of the Application Load Balancer"
  default     = ""
}


### TAGS

variable "owner" {
  type        = string
  description = "Tags"
  default     = ""
}