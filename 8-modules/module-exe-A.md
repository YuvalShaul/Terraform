### **Exercise: Provisioning a Standard AWS VPC Infrastructure**

This exercise focuses on utilizing the `terraform-aws-modules/vpc/aws` module to deploy a structured network environment.

#### **Exercise Requirements**

Configure the module to meet the following infrastructure specifications:

**VPC CIDR:** `10.0.0.0/16`
- **Availability Zones:** 
  - `us-east-1a`
  - `us-east-1b`
- **Public Subnets:** * 
  - `10.0.1.0/24` (Subnet A)
  - `10.0.2.0/24` (Subnet B)


- **Private Subnets:**
  - `10.0.101.0/24` (Subnet A)
  - `10.0.102.0/24` (Subnet B)


- **Gateway Requirements:**
  - Internet Gateway (IGW) enabled.
  - Single NAT Gateway enabled (shared across private subnets).


- **DNS Settings:**
  - Enable DNS Hostnames.
  - Enable DNS Support.



#### **Instructions**

1. **Define the Provider**
Create a `provider.tf` file and configure the AWS provider to use the `us-east-1` region.
2. **Declare the VPC Module**
In a `main.tf` file, call the `terraform-aws-modules/vpc/aws` module. Set the `source` to the official registry path and pin the version to `~> 5.0`.
3. **Assign Network Identifiers**
Map the `name` of the VPC to `my-vpc-exercise` and input the `cidr` block specified in the requirements.
4. **Configure Subnets and AZs**
Pass the list of Availability Zones to the `azs` argument. Use the `public_subnets` and `private_subnets` arguments to assign the required IP ranges.
5. **Enable Routing and Gateways**
Set `enable_nat_gateway` to `true`. To optimize cost for this exercise, set `single_nat_gateway` to `true`. Ensure `enable_vpn_gateway` remains `false`.
6. **Apply Metadata Tags**
Include a `tags` block to label the resources with `Terraform = "true"` and `Environment = "dev"`.
7. **Output Resource IDs**
Create an `outputs.tf` file. Define outputs that capture the `vpc_id`, `private_subnets` (list of IDs), and `public_subnets` (list of IDs) from the module's exported values.
8. **Execute and Validate**
Run the plan to verify that approximately 20+ resources will be created. Apply the configuration and use the AWS Console to verify that the Route Tables for private subnets are correctly pointing `0.0.0.0/0` to the NAT Gateway.

- Optional:
Create an ec2 instance in one of your subnets.