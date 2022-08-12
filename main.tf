provider "aws" {
  region = var.region
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "null_resource" "install-zxckjzxkcj" {
 provisioner "local-exec" {
       command = <<EOH
                   curl -o jq https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64
                    chmod 0755 jq
                  EOH
#   az --version
#   curl -sL https://aka.ms/InstallAzureCLIDeb | bash
#     interpreter = ["/bin/bash", "-c"]
#     working_dir = "${path.module}"
  }
}

resource "aws_instance" "ubuntu" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}
