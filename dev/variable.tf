variable "region" {
  default     = "eu-west-1"
  type        = string
  description = "AWS Region"
}

variable "product" {
  default     = "pagoefectivo"
  type        = string
  description = "The name of the LB. This name must be unique within your AWS account."
}

variable "environment" {
  default     = "development"
  type        = string
  description = "The envrionment where it will be deployed"

}

variable "environment_prefix" {
  default     = "dev"
  type        = string
  description = "The envrionment prefix where it will be deployed"
}

variable "service" {
  default     = "ratelimit"
  type        = string
  description = "The envrionment"
}

variable "vpcid" {
  default     = "vpc-d2da45b6"
  type        = string
  description = "Id Vpc"
}
