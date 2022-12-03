// Tabela de rotas Pública
resource "aws_route_table" "publica" {
        vpc_id = aws_vpc.materna.id
        route {
                cidr_block = "0.0.0.0/0"
                gateway_id = aws_internet_gateway.exterior.id
        }
        tags = {
                Name = "${var.nomeDoAmbiente}-publica"
        }
}

resource "aws_route_table_association" "acomplamento-subredePublica1" {
        subnet_id = aws_subnet.subredePublica1.id
        route_table_id = aws_route_table.publica.id
}
resource "aws_route_table_association" "acomplamento-subredePublica2" {
        subnet_id = aws_subnet.subredePublica2.id
        route_table_id = aws_route_table.publica.id
}
resource "aws_route_table_association" "acomplamento-subredePublica3" {
        subnet_id = aws_subnet.subredePublica3.id
        route_table_id = aws_route_table.publica.id
}

// Tabela de rotas Privada
resource "aws_route_table" "privada" {
        vpc_id = aws_vpc.materna.id
        route {
                cidr_block = "0.0.0.0/0"
                nat_gateway_id = aws_nat_gateway.natPrivada1.id
        }
        tags = {
                Name = "${var.nomeDoAmbiente}-privada"
        }
}

resource "aws_route_table_association" "acomplamento-subredePrivada1" {
        subnet_id = aws_subnet.subredePrivada1.id
        route_table_id = aws_route_table.privada.id
}
resource "aws_route_table_association" "acomplamento-subredePrivada2" {
        subnet_id = aws_subnet.subredePrivada2.id
        route_table_id = aws_route_table.privada.id
}
resource "aws_route_table_association" "acomplamento-subredePrivada3" {
        subnet_id = aws_subnet.subredePrivada3.id
        route_table_id = aws_route_table.privada.id
}