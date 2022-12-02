resource "tls_private_key" "rsa4096" {
   algorithm = "RSA"
   rsa_bits = 4096
}

resource "aws_key_pair" "parDeChaves" {

   key_name = "aws-ec2-administrador"
   public_key = tls_private_key.rsa4096.public_key_openssh

   provisioner "local-exec" {
      command = "echo '${tls_private_key.rsa4096.private_key_pem}' > ./aws-ec2-administrador.pem"
   }

}