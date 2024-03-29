# Key Pair Terraform File
resource "aws_lightsail_key_pair" "dev_key_pair_lightsail" {
  name = "dev_key"
  public_key = file(var.dev_key_path)
}

resource "aws_lightsail_key_pair" "jaehong21_key_pair_lightsail" {
  name = "jaehong21_key"
  public_key = file(var.jaehong21_key_path)
}

resource "aws_key_pair" "dev_key_pair" {
  key_name = "dev_key"
  public_key = file(var.dev_key_path)
}