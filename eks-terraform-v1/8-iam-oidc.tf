
# 这段代码是 Terraform 配置，用于为 AWS EKS (Elastic Kubernetes Service) 集群创建一个 IAM OpenID Connect (OIDC) 身份提供者。
# 这是实现 EKS 集群与 AWS IAM 服务集成的重要部分，主要用于支持 Kubernetes 的 ServiceAccount 与 IAM 角色的联合身份验证（IRSA - IAM Roles for Service Accounts）。


data "tls_certificate" "eks" {
  url = aws_eks_cluster.demo.identity[0].oidc[0].issuer
}

resource "aws_iam_openid_connect_provider" "eks" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.eks.certificates[0].sha1_fingerprint]
  url             = aws_eks_cluster.demo.identity[0].oidc[0].issuer
}
