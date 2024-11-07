resource "null_resource" "print_ips" {
  provisioner "local-exec" {
    command = <<EOT
      echo "Nginx Instance 1 Public IP: ${module.Public_EC2_Module.Nginx1_public_ip}" > All_IPs.txt
      echo "Nginx Instance 1 Private IP: ${module.Public_EC2_Module.Nginx1_private_ip}" >> All_IPs.txt
      echo "Nginx Instance 2 Public IP: ${module.Public_EC2_Module.Nginx2_public_ip}" >> All_IPs.txt
      echo "Nginx Instance 2 Private IP: ${module.Public_EC2_Module.Nginx2_private_ip}" >> All_IPs.txt
      echo "Apache Instance 1 Private IP: ${module.Private_EC2_Module.Private_EC2_1_Private_IP}" >> All_IPs.txt
      echo "Apache Instance 2 Private IP: ${module.Private_EC2_Module.Private_EC2_2_Private_IP}" >> All_IPs.txt
    EOT
  }
}