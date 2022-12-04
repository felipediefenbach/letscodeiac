resource "aws_route53_zone" "interna" {
  name = var.dominioPrivado
  comment = "${var.nomeDoAmbiente} ${var.dominioPrivado} zona interna"
  vpc {
    vpc_id = aws_vpc.materna.id
  }
}

resource "aws_route53_record" "backend" {
  zone_id = aws_route53_zone.interna.zone_id
  name    = "apibackend"
  type    = "A"
  ttl     = "30"
  records = [aws_instance.backend.private_ip]
}

resource "aws_route53_record" "frontend" {
  zone_id = aws_route53_zone.interna.zone_id
  name    = "apifrontend"
  type    = "A"
  ttl     = "30"
  records = [aws_instance.frontend.private_ip]
}

resource "aws_route53_record" "registry" {
  zone_id = aws_route53_zone.interna.zone_id
  name    = "registry"
  type    = "A"
  ttl     = "30"
  records = [aws_instance.frontend.private_ip]
}

resource "aws_route53_record" "database" {
  zone_id = aws_route53_zone.interna.zone_id
  name    = "mysqlbackend"
  type    = "CNAME"
  ttl     = "30"
  records = [aws_db_instance.mysqlbackend.address]
}
