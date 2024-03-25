data "aws_eks_cluster" "eks" {
  count = var.eks_cluster_name == "an-utterly-fake-k8s-cluster-name" ? 0 : 1
  name = var.eks_cluster_name
}

data "aws_eks_cluster_auth" "eks" {
  count = var.eks_cluster_name == "an-utterly-fake-k8s-cluster-name" ? 0 : 1
  name = var.eks_cluster_name
}

data "aws_secretsmanager_secret" "pem" {
  count = var.pem_secret_name == "a-super-fake-private-pem" ? 0 : 1
  arn = "arn:aws:secretsmanager:${var.aws_region}:${var.aws_account_id}:secret:${var.pem_secret_name}"
}

data "aws_secretsmanager_secret_version" "pem_string" {
  count = var.pem_secret_name == "a-super-fake-private-pem" ? 0 : 1
  secret_id = data.aws_secretsmanager_secret.pem[count.index].id
}
