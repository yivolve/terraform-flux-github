data "aws_eks_cluster" "eks" {
    name = var.eks_cluster_name
}

data "aws_eks_cluster_auth" "eks" {
    name = var.eks_cluster_name
}

data "aws_secretsmanager_secret" "pem" {
  arn = "arn:aws:secretsmanager:${var.aws_region}:${var.aws_account_id}:secret:${var.secret_name}"
}

data "aws_secretsmanager_secret_version" "pem_string" {
  secret_id = data.aws_secretsmanager_secret.pem.id
}
