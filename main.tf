provider "aws" {
	region = "us-east-1"
}

resource "aws_s3_bucket" "demo-s3" {
	bucket = "tf-demo-18-oct-23-15-19"
}

resource "aws_instance" "demo-ec2" {
	ami = var.ec2-ubuntu-ami
	instance_type = "t2.micro"
	tags ={
		Name= "terra-auto-instnace"
	}


}



