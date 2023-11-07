variable "components" {
  default = {
    cart = {
      name = "cart",
      instance_type= "t3.small"
    }
    catalogue = {
      name = "catalogue",
      instance_type= "t3.micro"
    }

  }
}
 module "ec2" {
   source = "./module"
   for_each = var.components
   name= each.value.name
   instance_type = each.value.instance_type
 }

## always iterate modules, not the resources
## always map the data and use for_each loop

output "public_ip" {
  value = {
      for k, v in module.ec2 : k => v["ec2"].public_ip
     }
}