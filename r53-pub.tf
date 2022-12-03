// zona dns .com.br
resource "aws_route53_zone" "publicoComBr" {
  name = "${var.publicoComBr}"
  comment = "${var.nomeDoAmbiente} ${var.publicoComBr} zona publica delegada"
  provisioner "local-exec" { command = "bash ./cloud-init/seta_delegacao_dns.sh ${self.zone_id} ${var.idZonaMaternaComBr} ${var.publicoComBr} ${var.terraformPerfil}" }
}

resource "aws_route53_record" "app" {
  zone_id = aws_route53_zone.publicoComBr.zone_id
  name    = "${var.publicoNomeDnsFrontend}"
  type    = "A"
  ttl     = "30"
  records = [aws_eip.frontend.public_ip]
}

resource "aws_route53_record" "acesso" {
  zone_id = aws_route53_zone.publicoComBr.zone_id
  name    = "acesso"
  type    = "A"
  ttl     = "30"
  records = [aws_eip.frontend.public_ip]
}
