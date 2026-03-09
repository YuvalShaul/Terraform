## Terraform Variables Exercise

This exercise guides you through the standard practice of separating your variable definitions, their actual values, and how they are used in your infrastructure.

---

### Prerequisites

* A dedicated directory for this exercise.
* AWS CLI configured.

---

### Instructions

1. **Define the Variables (`variables.tf`):**
* Create a file named `variables.tf`. (no default value)
* Declare a variable for your **AWS Region** (type: string, include a default value).
* Declare a variable for your **S3 Bucket Name** (type: string, include a brief description).
* Declare a variable for a **Project Tag** (type: string).


2. **Provide the Values (`terraform.tfvars`):**
* Create a file named `terraform.tfvars`.
* Assign specific strings to the **Bucket Name** and **Project Tag** variables you just defined.
* *Note: Terraform automatically loads any file ending exactly in `.tfvars`.*


3. **Use the Variables (`main.tf`):**
* Create a file named `main.tf`.
* Configure the `aws` provider, setting the `region` argument to your region variable using the `var.<NAME>` syntax.
* Create an `aws_s3_bucket` resource.
* Set the `bucket` argument using your bucket name variable.
* Add a `tags` block to the bucket, assigning your project tag variable to a key named `"Project"`.


4. **Execute the Configuration:**
* Run `terraform init`.
* Run `terraform plan`. Observe the output to ensure Terraform is pulling the values correctly from your `.tfvars` file.
* Run `terraform apply -auto-approve`.


5. **Verify & Cleanup:**
* Check the AWS Console to confirm the bucket exists with the tag you specified.
* Run `terraform destroy` to clean up.

---
