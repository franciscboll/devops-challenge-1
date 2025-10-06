module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  # Nombre legible para la VPC
  name = "vpc-${var.project_name}-${var.aws_region}"

  # Rango de direcciones IP para la VPC
  cidr = "10.0.0.0/16"

  # Zonas de disponibilidad a usar
  azs = ["us-east-1a", "us-east-1b", "us-east-1c"]

  # Subnets privadas para los nodos de EKS
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]

  # Subnets públicas para balanceadores de carga (ALB)
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  # Habilitar NAT Gateway (para salida a internet desde subnets privadas)
  enable_nat_gateway = true
  single_nat_gateway = true

  # Opcional: habilita VPN Gateway
  enable_vpn_gateway = true

  # Tags generales
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }

  # 🟢 Etiquetas para subnets públicas (usadas por el ALB público)
  public_subnet_tags = {
    "kubernetes.io/role/elb" = "1"
    "kubernetes.io/cluster/as-challenge-fran-us-east-1" = "owned"
  }

  # 🔵 Etiquetas para subnets privadas (usadas por el ALB interno o los nodos)
  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/as-challenge-fran-us-east-1" = "owned"
  }

  # 🟠 Etiqueta a la VPC para que el controller la identifique como parte del clúster
  vpc_tags = {
    "kubernetes.io/cluster/as-challenge-fran-us-east-1" = "owned"
  }
}