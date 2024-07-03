#defining the provider as aws
provider "aws" {
    region     = "${var.region}"
}

#create a RDS Database Instance
resource "aws_db_instance" "myrds" {
  engine               = "Postgres"
  identifier           = "myrds"
  allocated_storage    =  5
  engine_version       = "15.4"
  instance_class       = "db.t3.micro"
  username             = "postgres"
  password             = "admin123"
  skip_final_snapshot  = true
  publicly_accessible  =  true
  port                 = 5432    
  db_name              = "ecf"
  
}