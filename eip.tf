// EIP
resource "aws_eip" "frontend" {
   vpc = true
   tags = {
      Name = "${var.nomeDoAmbiente}-eip-frontend"
   }
}

// atribuicao do eip na instancia
resource "aws_eip_association" "frontend" {
   instance_id = aws_instance.frontend.id
   allocation_id = aws_eip.frontend.id
}
