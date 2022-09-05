data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}

data "aws_route53_zone" "hosted_zone" {
  name = var.domain_name
}

resource "tls_private_key" "instance_public_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "instance_key_pair" {
  key_name   = local.instance_key_name
  public_key = tls_private_key.instance_public_key.public_key_openssh

  provisioner "local-exec" {
    command = "echo '${tls_private_key.instance_public_key.private_key_pem}' > ./'${local.instance_key_name}'.pem"
  }

  tags = {
    Name = local.instance_key_name
  }
}

resource "aws_security_group" "allow_ssh_https_http" {
  name        = local.security_group_name
  description = "Allow TLS, HTTPS, and HTTP traffic from Anywhere"

  tags = {
    Name = local.security_group_name
  }

  ingress {
    description = "Allow SSH traffic from Anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP traffic from the internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTPs traffic from the internet"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "RocketChat Port"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "RocketChat Outgoing Port"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_instance" "chat_instance" {
  ami                         = data.aws_ami.amazon_linux_2.id
  instance_type               = var.ec2_instance_type
  key_name                    = aws_key_pair.instance_key_pair.key_name
  security_groups             = ["${aws_security_group.allow_ssh_https_http.name}"]
  disable_api_termination     = false
  associate_public_ip_address = true
#   user_data                   

  tags = {
    Name = local.instance_name
  }

}

resource "aws_route53_record" "chat_url" {
  name    = local.chat_url
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.chat_instance.public_ip}"]
  zone_id = data.aws_route53_zone.hosted_zone.zone_id
}
