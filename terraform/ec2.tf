#create a EC2 Instance
resource "aws_instance" "java-server" {
  ami           = "ami-087da76081e7685da"
  instance_type = "t2.micro"

  }