resource "tls_private_key" "my_key" { 
algorithm = "RSA" 
rsa_bits = 2048 
}
resource "local_file" "private_key" {
  filename = "${path.module}/Osama.pem"
  content  = tls_private_key.my_key.private_key_pem
}

resource "local_file" "public_key" {
  filename = "${path.module}/osama.pub"
  content  = tls_private_key.my_key.public_key_openssh
}


resource "aws_key_pair" "my_key_pair" { 
    key_name = "osama" # Desired key name 
     public_key = local_file.public_key.content
} 