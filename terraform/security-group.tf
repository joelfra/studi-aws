# RDS security group
resource "aws_security_group" "rds_sg" {
 name = "rds-sg"
 description = "Security group for RDS"

 ingress {
  from_port = 3306
  to_port = 3306
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

  ingress {
    description      = "Allow http from everywhere"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

    ingress {
    description      = "Allow http from jenkins"
    from_port        = 8081
    to_port          = 8081
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