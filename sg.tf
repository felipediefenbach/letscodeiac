resource "aws_security_group" "sshExterno" {

	name = "${var.nomeDoAmbiente}-ssh-externo"
	description = "Permite acesso ssh de qualquer origem"
	vpc_id = aws_vpc.materna.id

	ingress {
		description = "ssh"
		from_port = 22
		to_port = 22
		protocol = "tcp"
		cidr_blocks = var.sshOrigensPermitidas
 	}

	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}

	tags = {
		Name = "${var.nomeDoAmbiente}-ssh-Externo"
	}
}

resource "aws_security_group" "sshInterno" {

	name = "${var.nomeDoAmbiente}-ssh-interno"
	description = "Permite acesso ssh de qualquer origem"
	vpc_id = aws_vpc.materna.id

	ingress {
		description = "ssh"
		from_port = 22
		to_port = 22
		protocol = "tcp"
		cidr_blocks = [
			"${var.subredePublica1}",
			"${var.subredePublica2}",
			"${var.subredePublica3}",
			"${var.subredePrivada1}",
			"${var.subredePrivada2}",
			"${var.subredePrivada3}",
		]
 	}

	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}

	tags = {
		Name = "${var.nomeDoAmbiente}-ssh-interno"
	}
}

resource "aws_security_group" "rds" {

	name = "${var.nomeDoAmbiente}-rds"
	description = "Permite acesso ao Mysql do Backend"
	vpc_id = aws_vpc.materna.id

	ingress {
		description = "Mysql Backend"
		from_port = 3306
		to_port = 3306
		protocol = "tcp"
		cidr_blocks = [
			"${var.subredePrivada1}",
			"${var.subredePrivada2}",
			"${var.subredePrivada3}",
		]
 	}

	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}

	tags = {
		Name = "${var.nomeDoAmbiente}-rds"
	}
}

resource "aws_security_group" "backend" {

	name = "${var.nomeDoAmbiente}-ec2-backend"
	description = "Permite acesso as portas da Instancia do backend"
	vpc_id = aws_vpc.materna.id

	ingress {
		description = "Java APP"
		from_port = 8080
		to_port = 8080
		protocol = "tcp"
		cidr_blocks = [
			"${var.subredePublica1}",
			"${var.subredePublica2}",
			"${var.subredePublica3}",
		]
 	}

	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}
}

	resource "aws_security_group" "frontend" {

	name = "${var.nomeDoAmbiente}-ec2-frontend"
	description = "Permite acesso as portas da Instancia do frontend"
	vpc_id = aws_vpc.materna.id

	ingress {
		description = "http"
		from_port = 80
		to_port = 80
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
 	}

	ingress {
		from_port = 6443
		to_port = 6443
		protocol = "tcp"
		cidr_blocks = [
			"${var.subredePrivada1}",
			"${var.subredePrivada2}",
			"${var.subredePrivada3}",
		]
 	}

	ingress {
		from_port = 2379
		to_port = 2380
		protocol = "tcp"
		cidr_blocks = [
			"${var.subredePrivada1}",
			"${var.subredePrivada2}",
			"${var.subredePrivada3}",
		]
 	}

	ingress {
		from_port = 10250
		to_port = 10252
		protocol = "tcp"
		cidr_blocks = [
			"${var.subredePrivada1}",
			"${var.subredePrivada2}",
			"${var.subredePrivada3}",
		]
 	}

	ingress {
		from_port = 10255
		to_port = 10255
		protocol = "tcp"
		cidr_blocks = [
			"${var.subredePrivada1}",
			"${var.subredePrivada2}",
			"${var.subredePrivada3}",
		]
 	}

	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}

	tags = {
		Name = "${var.nomeDoAmbiente}-ec2-frontend"
	}
}