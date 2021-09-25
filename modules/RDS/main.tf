resource "aws_db_subnet_group" "DB_SG_BDD" {
  name       = var.db_subnet_group_name
  subnet_ids = [var.third-subnet, var.fourth-subnet]

  tags = {
    name = var.db_subnet_group_name
  }
}


resource "aws_db_instance" "BDD" {
  engine                 = var.engine_target
  engine_version         = var.engine_version_target
  instance_class         = var.instance_gabarit
  vpc_security_group_ids = [var.sg_bdd]
  db_subnet_group_name   = aws_db_subnet_group.DB_SG_BDD.id
  allocated_storage      = var.storage_value
  max_allocated_storage  = var.storage_max
  port                   = var.port_define
  name                   = var.name_BDD
  username               = var.user
  password               = var.password
  skip_final_snapshot    = true
}