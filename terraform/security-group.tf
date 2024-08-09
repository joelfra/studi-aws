# RDS security group
resource "aws_security_group" "rds_sg" {
 name = "rds-sg"
 description = "Security group for RDS"

 ingress {
  from_port = 5432
  to_port = 5432
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
   }

 egress {
  from_port   = 0
  to_port  = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  }
}


# EC2 security group
resource "aws_security_group" "my_sg" {
  name        = "my-sg"
 description = "Security group for EC2"
  vpc_id      = aws_vpc.main.id


  ingress {
    description      = "Allow http from everywhere"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

    ingress {
    description      = "Allow http from CodeDeploy"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }


  ingress {
    description      = "Allow http from everywhere"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    description      = "Allow outgoing traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "my-sg"
  }
}