resource "aws_instance" "Sandy_instance_1" {
  ami                    = data.aws_ami.ubuntu.id  
  instance_type          = var.Ec2_Instance_Type              
  subnet_id              = var.Private_Subnet1_id
  key_name               = "osama"
  vpc_security_group_ids = [var.Private_Security_Group_id]

  # User data to install Apache
  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install apache2 -y
              apt install unzip -y
              wget https://www.tooplate.com/zip-templates/2134_gotto_job.zip
              unzip 2134_gotto_job.zip
              cp -r /2134_gotto_job/* /var/www/html/
              systemctl start apache2
              systemctl enable apache2
              EOF

  tags = {
    Name = "MyPrivateEC2_1"
  }
}
output "EC2_1_id" {
  value = aws_instance.Sandy_instance_1.id
}
output "Private_EC2_1_Private_IP" {
  value = aws_instance.Sandy_instance_1.private_ip
}