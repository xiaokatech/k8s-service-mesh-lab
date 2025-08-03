resource "aws_subnet" "private_us_east_1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.0.0/19"
  availability_zone = "us-east-1a"

  tags = {
    project                           = "k8s-service-mesh-lab"
    "Name"                            = "private-us-east-1a"
    "kubernetes.io/role/internal-elb" = "1"     # 允许该子网托管 内部 Elastic Load Balancer (ELB)（如 Kubernetes Ingress Controller 的内部负载均衡器
    "kubernetes.io/cluster/demo"      = "owned" # 表示该子网属于名为 demo 的 Kubernetes 集群（如 Amazon EKS）
  }
}


resource "aws_subnet" "private_us_east_1b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.32.0/19"
  availability_zone = "us-east-1b"

  tags = {
    project                           = "k8s-service-mesh-lab"
    "Name"                            = "private-us-east-1b"
    "kubernetes.io/role/internal-elb" = "1"     # 允许该子网托管 内部 Elastic Load Balancer (ELB)（如 Kubernetes Ingress Controller 的内部负载均衡器
    "kubernetes.io/cluster/demo"      = "owned" # 表示该子网属于名为 demo 的 Kubernetes 集群（如 Amazon EKS）
  }
}

resource "aws_subnet" "public_us_east_1a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.64.0/19"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true # 自动分配公网IP（设为true表示实例启动时会自动获得公网IP）

  tags = {
    project                           = "k8s-service-mesh-lab"
    "Name"                            = "public-us-east-1a"
    "kubernetes.io/role/internal-elb" = "1"     # 允许该子网托管 内部 Elastic Load Balancer (ELB)（如 Kubernetes Ingress Controller 的内部负载均衡器
    "kubernetes.io/cluster/demo"      = "owned" # 表示该子网属于名为 demo 的 Kubernetes 集群（如 Amazon EKS）
  }
}


resource "aws_subnet" "public_us_east_1b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.96.0/19"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true # 自动分配公网IP（设为true表示实例启动时会自动获得公网IP）

  tags = {
    project                           = "k8s-service-mesh-lab"
    "Name"                            = "public-us-east-1b"
    "kubernetes.io/role/internal-elb" = "1"     # 允许该子网托管 内部 Elastic Load Balancer (ELB)（如 Kubernetes Ingress Controller 的内部负载均衡器
    "kubernetes.io/cluster/demo"      = "owned" # 表示该子网属于名为 demo 的 Kubernetes 集群（如 Amazon EKS）
  }
}
