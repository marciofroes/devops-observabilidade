resource "aws_instance" "dev" {
  count = 3
  ami = var.amis.us-east-1
  instance_type = var.instance_type_micro
  key_name = var.key_name
  tags = {
    Name = "dev${count.index}"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}


resource "aws_instance" "dev4" {
  ami = var.amis.us-east-1
  instance_type = var.instance_type_micro
  key_name = var.key_name
  tags = {
    Name = "dev4"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}","${aws_security_group.acesso-web01.id}"]
  depends_on = [aws_s3_bucket.labtestemaq4]
}

