// Ambiente
datacenterCorrente = "us-east-1"
nomeDoAmbiente = "adaletscode"
terraformPerfil = "conexinfra"
distribuicao = "ami-0c07df890a618c98a"
chaveSshPadrao = "aws-ec2-administrador"

// Dns
dominioPrivado = "adainterno"
publicoComBr = "homolog.conexaoinfraestrutura.inf.br"
idZonaMaternaComBr = "Z02989652E5N1GM1F7LD1"
publicoNomeDnsFrontend = "app"

// Rede
redeMaterna = "172.29.0.0/16"
subredePublica1 = "172.29.0.0/28"
subredePublica2 = "172.29.0.16/28"
subredePublica3 = "172.29.0.32/28"
subredePrivada1 = "172.29.0.48/28"
subredePrivada2 = "172.29.0.64/28"
subredePrivada3 = "172.29.0.80/28"
sshOrigensPermitidas= [
    "0.0.0.0/0",
]

// Bancos
mysqlBackendSenha = "N4t5%a0&vPx2"
mysqlBackendUsuario = "apibackend"
mysqlBackendDb = "letscodebyada"

// Maquinas
backendTipo = "t3a.medium"
frontendTipo = "t3a.medium"