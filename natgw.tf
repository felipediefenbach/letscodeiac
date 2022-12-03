resource "aws_eip" "natPrivada1" {
   vpc = true
   tags = {
      Name = "${var.nomeDoAmbiente}-eip-nat1"
   }
}
resource "aws_nat_gateway" "natPrivada1" {
  allocation_id = aws_eip.natPrivada1.id
  subnet_id = aws_subnet.subredePublica1.id
     tags = {
      Name = "${var.nomeDoAmbiente}-natgw1"
   }
}