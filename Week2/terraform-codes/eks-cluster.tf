resource "aws_eks_cluster" "test-eks-cluster" {

    depends_on = [ #EKS클러스터에대한 리소스가 테라폼에서 프로비저닝하기전에 '먼저 진행' 되어야 하는 부분
        aws_iam_role_policy_attachment.test-eks_iam_cluster_AmazonEKSClusterPolicy,
        aws_iam_role_policy_attachment.test-eks_iam_cluster_AmazonEKSVPCResourceController
    ]

    name = var.cluster-name #변수를 참조할때 var. 을 쓴다. 같은 경로(레벨) variables.tf를 참조한다. 
    role_arn = aws_iam_role.test-eks_iam_cluster.arn # 위에있는 롤을 참조하는 부분 '.arn' 리소스에 대한 고유한 네임을 가져온다.
    version = "1.22"

    vpc_config{ #EKS클러스터가 VPC의 서브넷과 SG를 할당했는지에 대해 설정
        security_group_ids = [aws_security_group.test-eks_sg_controlplane.id, aws_security_group.test-eks_sg_nodes.id]
        subnet_ids = flatten([aws_subnet.test-public-subnet[*].id]) # *<<애스터리스크를 넣은거는 어떤값이든간에 하나씩 가져가서 FLATTEN<<형변환 시킨다
        endpoint_public_access = true #EKS를 로컬PC에서 접속해야하는 부분
        public_access_cidrs = ["0.0.0.0/0"] #어떠한 인터넷의 IP대역도 적용을 해야함. 단/ SG를 적용했기때문에 해당포트로만 접속 가능함
    }

    tags = {
        "Name" = "TEST-EKS-CLUSTER"
    }
}