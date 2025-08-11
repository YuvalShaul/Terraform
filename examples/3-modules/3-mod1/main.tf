
module "mymod1" {
    source = "./mymod"
    param1 = 15
}



module "mymod2" {
    source = "./mymod"
    param1 = 17
}


resource null_resource "stam" {
    provisioner local-exec {
        command = "echo return from mymod1: ${module.mymod1.plusone} from mymod2: ${module.mymod2.plusone}"
    }
}