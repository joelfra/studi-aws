#create 2 EC2 Instance
resource "aws_instance" "instance_a" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = ["${aws_security_group.my_sg.id}"]
  tags = {
   Name = "Instance A"
  }

  user_data = <<-EOF
             #!/bin/bash
             sudo apt-get update
             sudo apt-get install -y nginx
             sudo systemctl start nginx
             sudo systemctl enable nginx
             echo '<!doctype html>
             <html lang="en"><h1>Home page 1 !</h1></br>
             <h3>(Instance A)</h3>
             </html>' | sudo tee /var/www/html/index.html
             EOF
 
  }
