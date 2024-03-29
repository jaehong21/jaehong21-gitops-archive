resource "aws_lightsail_instance" "jaehong21_vpn" {
  availability_zone = "ap-northeast-2a"
  blueprint_id      = "ubuntu_20_04"
  bundle_id         = "nano_2_0"
  name              = "jaehong21-vpn"
  key_pair_name     = var.key_pair
}
resource "aws_lightsail_instance_public_ports" "jaehong21_vpn_public_ports" {
  instance_name = aws_lightsail_instance.jaehong21_vpn.name
  port_info {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
  }
  port_info {
    from_port = 8080
    to_port   = 8080
    protocol  = "tcp"
  }
  port_info {
    from_port = 24148
    to_port   = 24148
    protocol  = "tcp"
  }
  port_info {
    from_port = 58401
    to_port   = 58401
    protocol  = "tcp"
  }
  port_info {
    from_port = 58401
    to_port   = 58401
    protocol  = "udp"
  }
}

resource "aws_lightsail_static_ip" "jaehong21_vpn_static_ip" {
  name = "jaehong21-vpn-static-ip"
}
resource "aws_lightsail_static_ip_attachment" "jaehong21_static_ip_attachment" {
  static_ip_name = aws_lightsail_static_ip.jaehong21_vpn_static_ip.name
  instance_name  = aws_lightsail_instance.jaehong21_vpn.name
}
