# Terraform will try to detect your variables values:
#
#  1 - terraform.tfvars
#  2 - terraform.tfvars.json
#  3 - Any file ending in .auto.tfvars (e.g., db_settings.auto.tfvars)
#  4 - Any file ending in .auto.tfvars.json
#
# Otherwise:
# If you name your file production.tfvars or secrets.tfvars, Terraform will not load it by default. 
# To use those values, you must explicitly tell Terraform to look for them in your command line:
#
#      terraform apply -var-file="production.tfvars"


app_region     = "us-east-1"
instance_count = 3
