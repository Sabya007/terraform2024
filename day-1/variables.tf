variable "ami" {
    description = "inserting values of ami to main.tf"
    type = string
    default = "ami-0d07675d294f17973"
  
}

variable "instance_type" {
  description = "inserting values of instance type to main.tf"
    type = string
    default = "t2.micro"
  
}

variable "keyname" {
  description = "inserting values of keypair to main.tf"
    type = string
    default = "practice"
}