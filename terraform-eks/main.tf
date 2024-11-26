module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "eks-demo-cluster"
  cluster_version = "1.26"

  vpc_id     = "vpc-0a1b2c3d4e5f6g7h8"
  subnet_ids = ["subnet-019ea91ed9b5252e7", "subnet-019ea91ed9b5253e8"]

  node_groups_defaults = {
    instance_types = ["t2.medium"]
    min_size       = 2
    max_size       = 3
  }

  node_groups = {
    eks_nodes = {}
  }
}
