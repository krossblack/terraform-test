resource "aws_instance" "test" {
    ami = "ami-89634988"
    instance_type = "t2.micro"
    key_name = "${var.key_name}"

    # Our Security group to allow HTTP and SSH access
    security_groups = ["${aws_security_group.test.name}"]

    iam_instance_profile = "ec2"
    root_block_device {
        delete_on_termination = "true"
        volume_size = "8"
    }
    tags {
        Name = "test"
        Project = "test"
        Stage = "production"
        Roles = "web"
    }
}

resource "aws_security_group" "test" {
    name = "test"
    description = "Used in the terraform"

    # SSH access from anywhere
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
