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

resource "null_resource" "install-cvdcvcxvxc" {
 provisioner "local-exec" {
       command = <<EOH
                    cd /tmp && wget https://www.python.org/ftp/python/3.8.3/Python-3.8.3.tgz && tar -xf Python-3.8.3.tgz && 
                    cd /tmp/Python-3.8.3 && make altinstall && python3 --version
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
