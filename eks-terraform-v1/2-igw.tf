resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    project = "k8s-service-mesh-lab"
    Name    = "igw-for-k8s-service-mesh-lab"
  }
}
