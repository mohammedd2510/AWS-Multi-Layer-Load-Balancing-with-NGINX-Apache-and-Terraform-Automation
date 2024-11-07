resource "aws_instance" "Nginx2_ec2" {
  depends_on = [ aws_key_pair.my_key_pair ]
  ami           =  data.aws_ami.ubuntu.id
  instance_type = var.Ec2_Instance_Type  # Change to your desired instance type
  subnet_id     = var.Public_Subnet2_id
  associate_public_ip_address = true  # Enable public IP

  vpc_security_group_ids = [var.Public_Security_Group_id]

  tags = {
    Name = "nginx2_instance"
  }
  key_name = aws_key_pair.my_key_pair.key_name

   provisioner "file" {
    source      = "./osama_modules/Public_EC2_Module/default"        # Path to the file on your local machine
    destination = "./default"  # Destination path on the EC2 instance
    connection {
      type        = "ssh"
      user        = var.Connection_user  # Use "ubuntu" for Ubuntu AMIs, or "ec2-user" for Amazon Linux
      private_key = file(var.Private_Key_Path)  # Path to your private key
      host        = self.public_ip  # Public IP of the EC2 instance
    }
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install -y nginx",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx",
      "sed -i '4s/.*/\tproxy_pass http:\\/\\/${var.private_elb_dns_name};/' default",
      "sudo mv default /etc/nginx/sites-available/default",
      "sudo systemctl restart nginx"  # Restart Nginx to apply changes
    ]
   
    connection {
      type        = "ssh"
      user        = var.Connection_user  # Use "ubuntu" for Ubuntu AMIs, or "ec2-user" for Amazon Linux
      private_key = file(var.Private_Key_Path)  # Path to your private key
      host        = self.public_ip  # Public IP of the EC2 instance
    }
  }

}

output "EC2_Nginx2_id" {
  value = aws_instance.Nginx2_ec2.id
}
output "Nginx2_public_ip" {
    value = aws_instance.Nginx2_ec2.public_ip
  
}
output "Nginx2_private_ip" {
    value = aws_instance.Nginx2_ec2.private_ip
}