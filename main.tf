provider "aws" {
  region = "ap-south-1" 
}

resource "aws_instance" "nginx_instance" {
  ami           = "ami-09b0a86a2c84101e1" 
  instance_type = "t2.micro"           
  key_name      = "demophani"          

  # Enable SSH access
  security_groups = [aws_security_group.nginx_sg.name]

  tags = {
    Name = "NginxServer"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y nginx",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"             
      private_key = file("demophani.pem")
      host        = self.public_ip
    }
  }
}

# Security group to allow HTTP and SSH
resource "aws_security_group" "nginx_sg" {
  name        = "nginx_sg"
  description = "Allow HTTP and SSH"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

