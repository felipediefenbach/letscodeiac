// Vpc
resource "aws_vpc" "materna" {
	cidr_block = var.redeMaterna
	enable_dns_support = "true"
	enable_dns_hostnames = "true"
    	tags = {
      	        Name = "${var.nomeDoAmbiente}-vpc"
    	}
}

// Internet Gateway
resource "aws_internet_gateway" "exterior" {
	vpc_id = aws_vpc.materna.id
    	tags = {
      		Name = "${var.nomeDoAmbiente}-igw"
    	}
}

// Configuração DHCP
resource "aws_vpc_dhcp_options" "configuracoes-dhcp" {
        domain_name = var.dominioPrivado
        domain_name_servers = ["AmazonProvidedDNS"]
        tags = {
                Name = "${var.nomeDoAmbiente}-dhcp"
        }
}

resource "aws_vpc_dhcp_options_association" "acomplamento-dhcp" {
        vpc_id = aws_vpc.materna.id
        dhcp_options_id = aws_vpc_dhcp_options.configuracoes-dhcp.id
}
