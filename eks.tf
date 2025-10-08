module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name               = "${var.project_name}-${var.aws_region}"
  kubernetes_version = "1.30"

  addons = {
    coredns                = {}
    eks-pod-identity-agent = {
      before_compute = true
    }
    kube-proxy             = {}
    vpc-cni                = {
      before_compute = true
    }
  }

  # Optional
  endpoint_public_access = true

  # Optional: Adds the current caller identity as an administrator via cluster access entry
  enable_cluster_creator_admin_permissions = true

  vpc_id                   = "vpc-0895e8617560989aa"
  subnet_ids               = ["subnet-0030ab39b795341e2", "subnet-06abae956858a70fa", "subnet-0471dbe93300b73e8"]
  control_plane_subnet_ids = ["subnet-0030ab39b795341e2", "subnet-06abae956858a70fa", "subnet-0471dbe93300b73e8"]

  # EKS Managed Node Group(s)
  eks_managed_node_groups = {
    default = {
      # Starting on 1.30, AL2023 is the default AMI type for EKS managed node groups
      ami_type       = "AL2023_x86_64_STANDARD"
      instance_types = ["t3.medium"]

      min_size     = 1
      max_size     = 1
      desired_size = 1
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}