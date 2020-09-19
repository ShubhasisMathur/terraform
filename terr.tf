
provider "aws" {
  region     = var.region
  access_key = "AKIAQJLZNAHA5K3CR6JE"
  secret_key = "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"
  version    = ">=2.8"
}

variable "region" {
  default = "us-east-1"
}


### rds.tf
resource "aws_db_instance" "default" {
  allocated_storage    = 5
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "foo"
  password             = file("../rds_pass.txt")
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot = "true"
}
