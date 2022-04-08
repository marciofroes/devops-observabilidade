variable "amis" {
  type = map(string)
  default = {
    "us-east-1" = "ami-04505e74c0741db8d"
    "us-east-2" = "ami-064ff912f78e3e561"
  }
}

variable "cdirs_acesso_remoto" {
  type = list(string)
  default = ["164.163.1.82/32"]
}

variable "key_name" {
  default = "terraform-aws"
}

variable "instance_type_micro" {
  default = "t2.micro"
}