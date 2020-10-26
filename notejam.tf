data "aws_ami" "notejam" {
    owners = ["self"]
    name_regex = "notejam_django_automation"
  }

resource "aws_instance" "notejam" {
  ami           = "{data.aws_ami.notejam.id}"
  instance_type = "t2.micro"
  key_name = "notejam"
  }

resource "aws_security_group" "open_8000_and_ssh" {
  name        = "open_8000_and_ssh"
  description = "oopen_8000_and_ssh port for inbound traffic"
  
  ingress {
    description = "8000 from VPC"
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "22 from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "open_8000_and_ssh"
  }
}  

resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = aws_security_group.open_8000_and_ssh.id 
  network_interface_id = aws_instance.notejam.primary_network_interface_id
}

module "key_pair" {
  source = "terraform-aws-modules/key-pair/aws"
  key_name   = "notejam"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCyYZGvc3W4dxCRH+oTru7luhaMYRjl7p3woZ5L2YHq/TexBveNC0ePlJay826PEGnorHmlndziQ+GZuC2lYxQm1/McCwlo42sEtYWE6sZUMBEbFdMdAJq3OPdphxxZSK6/pcAQXEI3Lw5IEBcT4pvTqNK/oLOZDN+0qbgymWOZAHRTEblPzJPfA4d/Zt3M0GyM9m8Q0avf2CvhtIjQzND0gn3BuevsKSytr5B9PkvMxGr8PUsxRrd74ox1dG0uiXbXHz7Mc9aJTArM8AfepQOqAA0SyLWQZCeGIsiLo8FkV0QPQwp3QRErae6F0VKVF56fup3FxmKDZRs1FF1FmJhL notejam"
}
