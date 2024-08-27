variable "ami" {
    description = "passing values of amiid to main.tf"
    type = string
    default=""
  
}

variable "instance_type" {
    type=string
    default = ""
 
}
variable "key_name" {
 type =  string
 default=""
}