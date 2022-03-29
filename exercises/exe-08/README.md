# Exercise #8: Terraform Data and Reference

We've covered HCL data and variable concepts pretty completely at this point, but we want to finish off by looking closely
at one other thing: Terraform data sources and referencing these data sources.

Remember earlier when we queried the state of another terraform project? That was a Terraform data source. We want to look at how
providers allow you the ability to query particular sources to get things you need at runtime with the same mechanism.
Two very common examples in the AWS provider:

* Querying available AMI images in AWS to get the AMI ID to use for your EC2 instance
* Querying availability zones in your current AWS region
  * This is useful for things like ensuring that you have a resource in every AZ for your region

4. Let's look at some of this in action

 ```bash
 cd other-data
 terraform init
 terraform apply
 ```

 You should get something like the following as the output:

 ```
 data.aws_ami.ubuntu: Refreshing state...
 data.aws_availability_zones.available: Refreshing state...

 Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

 Outputs:

 current_region_availability_zones = [
     "us-east-2a",
     "us-east-2b",
     "us-east-2c",
 ]
 most_recent_ubuntu_ami_id = ami-0d03add87774b12c5
 ```

 Two different data sources are being called here:
 * The AWS AMI data source
 * The AWS availability zones data source


5. Look at the `main.tf` relevant resource that actually did the AMI querying for us:

 ```hcl
 # A Terraform data source is a specific type of resource that gives us the ability to pull in data from elsewhere to
 # use in our own terraform HCL and operations
 data "aws_ami" "ubuntu" {
     most_recent = true

     filter {
       name   = "name"
       values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
     }

     filter {
       name   = "virtualization-type"
       values = ["hvm"]
     }

     owners = ["099720109477"] # Canonical
}
```

 * Don't worry too much about all the pieces here, the most important part to understand right now is really `data "aws_ami"`
 * This is a data source type resource that is a generic construct in Terraform itself
 * The AWS provider implements this `aws_ami` data
source type so that we can query AMIs available in AWS
 * After the data source resource is declared, we can then access it's attributes that have been populated by actually making the query to AWS `${data.aws_ami.ubuntu.id}`


6. Now look at the availability zone query pieces

 ```hcl
 # Another AWS provider data source, giving us the ability to get all of the AZs in our current region
 data "aws_availability_zones" "available" {
     state = "available"
 }
 ```

 * __Availability zones are specific to a particular region, and we're not passing in a region here, so how is this working?__
 * If you can't figure out, ask your instructor for a little help

 * Similar to the AMI data source, this one also has attributes that have been populated and can be accessed after the query to the AWS api actually happens
 * So in our subsequent HCL, we can access the `names` attribute, giving us all AZ names like this:
 `
 ${data.aws_availability_zones.available.names}
 `

### Finishing off this exercise

We're gonna do a little bit of experimenting as a way to finish off this exercise. This will give you an opportunity to play
a bit with things that look interesting to you in the HCL syntax, variable, and data usage areas:

* Conditionals like ternary syntax, other expressions: https://www.terraform.io/docs/configuration/expressions.html
* Interpolation, figuring what you can and can't do here
* Built-in functions: https://www.terraform.io/docs/configuration/functions.html

Maybe try some of the above out with `terraform console`?
