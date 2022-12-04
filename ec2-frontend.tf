// EC2 frontend
data "template_file" "frontend" {
  template = file("./cloud-init/frontend.sh")
}
resource "aws_instance" "frontend" {
	user_data = data.template_file.frontend.rendered
	ami = var.distribuicao
	instance_type = var.frontendTipo
	availability_zone = "${var.datacenterCorrente}a"
	subnet_id = aws_subnet.subredePublica1.id
	vpc_security_group_ids = [
		aws_security_group.sshInterno.id,
		aws_security_group.sshExterno.id,
		aws_security_group.frontend.id,
	]
	key_name = var.chaveSshPadrao
	
	root_block_device {
		volume_type = var.discoRaizTipo
		volume_size = var.discoRaizTamanho
		iops = var.discoRaizIops
		throughput = var.discoRaizVelocidade
		delete_on_termination = "true"
		tags = {
			Name = "${var.nomeDoAmbiente}-root"
		}
	}

	tags = {
		Name = "${var.nomeDoAmbiente}-frontend"
	}

	depends_on = [aws_key_pair.parDeChaves]
}

output "ec2IdFrontend" {
  value = aws_instance.frontend.id
}