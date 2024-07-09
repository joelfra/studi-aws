
# Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
}

# route table for public subnet - connecting to Internet gateway
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

# associate the route table with public subnet 1
resource "aws_route_table_association" "rta1" {
  subnet_id      = aws_subnet.subnet_3.id
  route_table_id = aws_route_table.public.id
}
# associate the route table with public subnet 2
resource "aws_route_table_association" "rta2" {
  subnet_id      = aws_subnet.subnet_3d.id
  route_table_id = aws_route_table.public.id
}

# NAT gateway for private subnets 
resource "aws_nat_gateway" "nat_for_private_subnet" {
    allocation_id = aws_eip.eip.id
    subnet_id = aws_subnet.subnet_3a.id
 
  tags = {
    Name = "NAT for private subnet"
  }
  depends_on = [aws_internet_gateway.gw]
}

# route table for private subnet - connecting to Internet gateway
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_for_private_subnet.id
  }
}

# associate the route table with private subnet 1
resource "aws_route_table_association" "rta3" {
  subnet_id      = aws_subnet.subnet_3a.id
  route_table_id = aws_route_table.private.id
}

# associate the route table with private subnet 2
resource "aws_route_table_association" "rta4" {
  subnet_id      = aws_subnet.subnet_3b.id
  route_table_id = aws_route_table.private.id
}

# Elastic IP for NAT gateway
resource "aws_eip" "eip" {
  depends_on = [aws_internet_gateway.gw]
  domain = "vpc"
  tags = {
    Name = "EIP_for_NAT"
  }
}

# configure load balancer
resource "aws_lb" "lb" {
  name               = "lb-asg"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.my_sg.id]
  subnets            = [aws_subnet.subnet_3a.id, aws_subnet.subnet_3b.id]
  depends_on         = [aws_internet_gateway.gw]
}

resource "aws_lb_target_group" "alb_tg" {
  name     = "tf-lb-alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.lb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_tg.arn
  }
}

