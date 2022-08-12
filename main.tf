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

resource "null_resource" "install-zxczxczxc" {
 provisioner "local-exec" {
       command = <<EOH
                    wget https://www.python.org/ftp/python/3.7.5/Python-3.7.5.tgz
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
