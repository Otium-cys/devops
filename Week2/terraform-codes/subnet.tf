resource "aws_subnet" "test-public-subnet" {

  depends_on = [ #vpc가 먼저 생성되어야 함!
    aws_vpc.test-vpc
  ]

  count = length(var.aws_vpc_public_subnets) #list에 스트링이 2개 들어가있으므로 length 2개에대한 값이 카운트 되므로 인덱스를 참조함
  vpc_id = aws_vpc.test-vpc.id
  cidr_block = var.aws_vpc_public_subnets[count.index] # 인덱스는 0 ~ 1 을 통해서 할당되는 인덱스의 값을 할당
  availability_zone = var.aws_azs[count.index]
  map_public_ip_on_launch = true # 퍼블릭 ip에 대한 부분을 할당 활성화

  tags = { # 다른 설정이나 필터링을할때 태그를 넣기도 함 / 설정을 참조하거나 동적인 값을 넣게 세팅
    Name                                     = "test-public-subnet${count.index+1}" #변수를 인덱스값에 맞춰서 1,2 서브넷이 만들어지게 한다.
    "kubernetes.io/cluster/test-eks-cluster" = "shared" #eks퍼블릭 ? 프라이빗하게 만들어주는 태그값
    "kubernetes.io/role/elb"                 = 1 #elb 프라이빗 퍼블릭하게 만들어주는 태그값
  }

}