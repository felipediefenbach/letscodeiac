// Públicas
resource "aws_subnet" "subredePublica1" {
   availability_zone = "${var.datacenterCorrente}a"
   vpc_id = aws_vpc.materna.id
   cidr_block = var.subredePublica1
   tags = {
      Name = "${var.nomeDoAmbiente}-subredePublica1"
   }
}

resource "aws_subnet" "subredePublica2" {
   availability_zone = "${var.datacenterCorrente}b"
   vpc_id = aws_vpc.materna.id
   cidr_block = var.subredePublica2
   tags = {
      Name = "${var.nomeDoAmbiente}-subredePublica2"
   }
}

resource "aws_subnet" "subredePublica3" {
   availability_zone = "${var.datacenterCorrente}c"
   vpc_id = aws_vpc.materna.id
   cidr_block = var.subredePublica3
   tags = {
      Name = "${var.nomeDoAmbiente}-subredePublica3"
   }
}

// Privadas
resource "aws_subnet" "subredePrivada1" {
   availability_zone = "${var.datacenterCorrente}d"
   vpc_id = aws_vpc.materna.id
   cidr_block = var.subredePrivada1
   tags = {
      Name = "${var.nomeDoAmbiente}-subredePrivada1"
   }
}

resource "aws_subnet" "subredePrivada2" {
   availability_zone = "${var.datacenterCorrente}e"
   vpc_id = aws_vpc.materna.id
   cidr_block = var.subredePrivada2
   tags = {
      Name = "${var.nomeDoAmbiente}-subredePrivada2"
   }
}

resource "aws_subnet" "subredePrivada3" {
   availability_zone = "${var.datacenterCorrente}f"
   vpc_id = aws_vpc.materna.id
   cidr_block = var.subredePrivada3
   tags = {
      Name = "${var.nomeDoAmbiente}-subredePrivada3"
   }
}
