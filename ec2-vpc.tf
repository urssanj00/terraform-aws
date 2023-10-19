 
resource "aws_key_pair" "mykey" {
    key_name = "tera_key"
    public_key = file("C:\\Users\\urssa/.ssh/id_rsa.pub")

}



resource "aws_default_vpc" "default_vpc" {
# default attibute will come from aws
}

resource "aws_security_group" "allow_ssh" {
    name = "allow_ssh"
    description = "Allow ssh inbound traffic"

   
    vpc_id = aws_default_vpc.default_vpc.id

    ingress {
        description = "TLS from VPC"

        from_port = 22
        to_port = 22
        protocol = "tcp"

        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "allow_ssh"
    }
}

resource "aws_instance" "my-vpc-instance" {
    key_name = aws_key_pair.mykey.key_name
    ami = var.ec2-ubuntu-ami
    instance_type = "t2.micro"

    security_groups = [aws_security_group.allow_ssh.name]

    tags = {
        Name = "ec2-vpc-instnace"
    }

}
