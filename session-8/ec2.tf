resource "aws_instance" "main" {
  ami                    = data.aws_ami.amazon_linux_2.image_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.web.id]
  user_data              = data.template_file.user_data.rendered
  key_name               = aws_key_pair.terraform_server.key_name
  tags = {
    Name = var.env
  }

  ##############  File provisioner
  provisioner "file" {
    source      = "/home/ec2-user/terraform-session-october/session-8/index.html" # local machine
    destination = "/tmp/index.html"                                               # remote machine
    connection {
      type        = "ssh"
      user        = "ec2-user"
      host        = self.public_ip
      private_key = file("~/.ssh/id_rsa")
    }
  }

  ########### Remote Exec provisioner
  provisioner "remote-exec" {
    inline = [
      "sudo yum install httpd -y",
      "sudo systemctl enable httpd",
      "sudo systemctl start httpd",
      "sudo cp /tmp/index.html /var/www/html/index.html"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      host        = self.public_ip
      private_key = file("~/.ssh/id_rsa")
    }
  }
}

resource "aws_key_pair" "terraform_server" {
  key_name   = "terraform-server"
  public_key = file("~/.ssh/id_rsa.pub")
}

########### Local exec provisioner
resource "null_resource" "local_script" {
  provisioner "local-exec" {
    command = "echo 'hello from the local exec' > local.txt"
  }
}