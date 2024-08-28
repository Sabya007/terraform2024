# Launch Instance 
resource "aws_instance" "prod" {
    ami = "ami-0d07675d294f17973"
    instance_type = "t2.micro"
    key_name = "practice"
    subnet_id = aws_subnet.cust.id
    vpc_security_group_ids = [aws_security_group.allow_tls.id]
    tags = {
      Name = "myec2"
    }

}