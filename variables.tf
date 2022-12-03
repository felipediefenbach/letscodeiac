// AMBIENTE
variable "datacenterCorrente" {}
variable "nomeDoAmbiente" {}
variable "terraformPerfil" {}
variable "distribuicao" {}
variable "chaveSshPadrao" {}

// R53
variable "dominioPrivado" {}
variable "publicoComBr" {}
variable "idZonaMaternaComBr" {}
variable "publicoNomeDnsFrontend" {}

// VPC
variable "redeMaterna" {}
variable "subredePublica1" {}
variable "subredePublica2" {}
variable "subredePublica3" {}
variable "subredePrivada1" {}
variable "subredePrivada2" {}
variable "subredePrivada3" {}
variable "sshOrigensPermitidas" {}

// RDS
variable "mysqlBackendSenha" {}
variable "mysqlBackendUsuario" {}

// EC2
variable "discoRaizTipo" { default = "gp3" }
variable "discoRaizTamanho" { default = "10" }
variable "discoRaizIops" { default = "3000" }
variable "discoRaizVelocidade" { default = "128" }

variable "backendTipo" {}
variable "frontendTipo" {}