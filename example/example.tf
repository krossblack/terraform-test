resource "aws_instance" "example" {
    ami = "ami-89634988"
    instance_type = "t2.micro"
    key_name = "${var.key_name}"

    # Our Security group to allow HTTP and SSH access
    security_groups = ["${aws_security_group.default.name}"]
}

resource "aws_security_group" "default" {
    name = "terraform_example"
    description = "Used in the terraform"

    # SSH access from anywhere
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

    }

}
