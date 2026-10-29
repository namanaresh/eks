module "eks" {
 source = "terraform-aws-modules/eks/aws"
 version = "20.31.6"
 cluster_name = var.cluster-name
 cluster_version = "1.31"
 vpc_id = "vpc-05921cbec441ea95e"
 subnet_ids = ["subnet-0a4d07ac16902e497", "subnet-0e09da71e8bf8131c"]
 cluster_endpoint_public_access = true
 enable_cluster_creator_admin_permissions = true
 eks_managed_node_groups = {
    general = {
      desired_size = 1
      min_size     = 1
      max_size     = 2

      instance_types = ["t3.medium"]

      capacity_type = "ON_DEMAND"
    } 
 }  
 cluster_compute_config = {
   enabled = true
   node_pools = ["general-purpose"]
 }
 tags = {
   Environment = "dev"
   Terraform = "true"
 }
}