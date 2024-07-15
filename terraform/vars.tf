variable "region" {
    description = "AWS region"
}

variable "ami_id" {
  default = "ami-087da76081e7685da"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_pair_name" {
  description = "key_pair_name"
  type        = string
}