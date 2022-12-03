resource "aws_db_subnet_group" "mysqlbackend" {
   name = "mysqlbackend"
   subnet_ids = [aws_subnet.subredePrivada1.id, aws_subnet.subredePrivada2.id, aws_subnet.subredePrivada3.id]
   tags = {
      Name = "${var.nomeDoAmbiente}-dbredes"
   }
}

resource "aws_db_instance" "mysqlbackend" {
   identifier = "mysqlbackend"
   db_name = var.mysqlBackendDb
   instance_class = "db.t3.micro"
   allocated_storage = 5
   engine = "mysql"
   engine_version = "5.7"
   username = var.mysqlBackendUsuario
   password = var.mysqlBackendSenha
   db_subnet_group_name = aws_db_subnet_group.mysqlbackend.name
   vpc_security_group_ids = [aws_security_group.rds.id]
   parameter_group_name = "default.mysql5.7"
   skip_final_snapshot = true
   tags = {
      Name = "${var.nomeDoAmbiente}-rds"
   }
}