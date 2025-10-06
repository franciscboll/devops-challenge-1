variable "aws_region" {
    description = "Region de AWS donde se desplegará la infraestructura"
    type        = string
    default     =  "us-east-1"
}

variable "project_name" {
  description = "Prefijo del nombre del proyecto para todos los recursos"
  type        = string
  default     = "as-challenge-fran"
}