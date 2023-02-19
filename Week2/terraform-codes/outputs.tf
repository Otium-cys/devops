output "cluster_name" {
  value = aws_eks_cluster.test-eks-cluster.name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.test-eks-cluster.endpoint
}

#아웃풋 타입 : 대상 리소스에대해 출력하는 것