terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.0"
        }
    }
}

provider "aws" {
    region = "eu-west-2"
}

resource "aws_instance" "example" {
    
    count=10

    ami = "ami-0eb260c4d5475b901"
    instance_type = "t2.micro"  

    tags = {
        Name = "example-${count.index}"

    }

}


resource "aws_s3_bucket" "manisha-bucket-creation" {
  bucket = "my-tf-test-bucket-manisha"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

