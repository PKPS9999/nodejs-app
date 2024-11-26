module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "eks-demo-cluster"
  cluster_version = "1.26"

  vpc_id     = "vpc-0a1b2c3d4e5f6g7h8"
  subnet_ids = ["subnet-0abcd1234efgh5678", "subnet-0wxyz1234mnop5678"]

  node_groups_defaults = {
    instance_types = ["t3.medium"]
    min_size       = 2
    max_size       = 3
  }

  node_groups = {
    eks_nodes = {}
  }
}
