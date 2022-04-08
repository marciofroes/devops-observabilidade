resource "aws_instance" "dev6" {
  provider = aws.us-east-2
  ami =  var.amis.us-east-2
  instance_type = var.instance_type_micro
  key_name = var.key_name
  tags = {
    Name = "dev6"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh-us-east-2.id}"]
  depends_on = [aws_dynamodb_table.db-labs-01]
}




resource "aws_dynamodb_table" "db-labs-01" {
  name              = "GameScore"
  billing_mode      = "PAY_PER_REQUEST"
  provider          =  aws.us-east-2
  hash_key          = "UserId"
  range_key         = "GameTitle" 

  attribute {
    name = "UserId"
    type = "S"
  }

    attribute {
    name = "GameTitle"
    type = "S"
  }
}