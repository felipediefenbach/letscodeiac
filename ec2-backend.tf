// EC2 Backend
data "template_file" "backend" {
  template = file("./cloud-init/backend.sh")
}
resource "aws_instance" "backend" {
	user_data = data.template_file.backend.rendered
	ami = var.distribuicao
	instance_type = var.backendTipo
	availability_zone = "${var.datacenterCorrente}d"
	subnet_id = aws_subnet.subredePrivada1.id
	vpc_security_group_ids = [
		aws_security_group.sshInterno.id,
		aws_security_group.backend.id,
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
		Name = "${var.nomeDoAmbiente}-backend"
	}

	depends_on = [aws_key_pair.parDeChaves]
}

output "ec2IdBackend" {
  value = aws_instance.backend.id
}