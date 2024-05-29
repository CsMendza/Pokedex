# Pokedex
provider "aws" {
  region  = "us-east-1"
}

resource "aws_default_vpc" "default_vpc" {
  tags = {
    Name = "VPC predeterminada"
  }
}

#todas las zonas de disponibilidad en la región
data "aws_availability_zones" "available_zones" {}

# Crea una subred predeterminada en la primera Zona de Disponibilidad si no existe una
resource "aws_default_subnet" "subnet_az1" {
  availability_zone = data.aws_availability_zones.available_zones.names[0]
}

# Crea una subred predeterminada en la segunda Zona de Disponibilidad si no existe una
resource "aws_default_subnet" "subnet_az2" {
  availability_zone = data.aws_availability_zones.available_zones.names[1]
}

# Grupo de seguridad para el servidor web
resource "aws_security_group" "webserver_security_group" {
  name        = "Grupo de seguridad para servidor web"
  description = "habilitar acceso http y ssh"
  vpc_id      = aws_default_vpc.default_vpc.id

  ingress {
    description = "acceso http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "acceso ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Grupo de seguridad para servidor web"
  }
}

# Grupo de seguridad para la base de datos
resource "aws_security_group" "database_security_group" {
  name        = "Grupo de seguridad para base de datos"
  description = "habilitar acceso mysql en el puerto 3306"
  vpc_id      = aws_default_vpc.default_vpc.id

  ingress {
    description      = "acceso db"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Grupo de seguridad para base de datos"
  }
}

# Grupo de subred para las instancias RDS
resource "aws_db_subnet_group" "database_subnet_group" {
  name        = "subred-db"
  subnet_ids  = [aws_default_subnet.subnet_az1.id, aws_default_subnet.subnet_az2.id]
  description = "subredes para instancia de base de datos"

  tags = {
    Name = "subred-db"
  }
}

# Instancia RDS
resource "aws_db_instance" "db_instance" {
  engine                = "mysql"
  engine_version        = "8.0.35"
  multi_az              = false
  identifier            = "pokedex-rds-instance"
  username              = "user"
  password              = "password"
  instance_class        = "db.t2.micro"
  allocated_storage     = 200
  db_subnet_group_name  = aws_db_subnet_group.database_subnet_group.name
  vpc_security_group_ids = [aws_security_group.database_security_group.id]
  availability_zone     = data.aws_availability_zones.available_zones.names[0]
  db_name               = "pokedexdb"
  skip_final_snapshot   = true
}
