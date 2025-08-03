# nat: Network Address Translation

resource "aws_eip" "nat" {
  vpc = true

  tags = {
    project = "k8s-service-mesh-lab"
    Name    = "nat-for-k8s-service-mesh-lab"
  }
}


resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_us_east_1a.id

  tags = {
    project = "k8s-service-mesh-lab"
    Name    = "nat-for-k8s-service-mesh-lab"
  }

  depends_on = [aws_internet_gateway.igw]
}
