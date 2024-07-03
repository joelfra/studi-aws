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