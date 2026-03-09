## Exercise: Deploy an AWS S3 Bucket

This exercise guides you through creating a single Terraform configuration file to provision a private storage bucket.

---

### Prerequisites

* **AWS CLI** configured with active credentials.
* **Terraform CLI** installed.

---

### Instructions

1. **Directory:** Use the current directory (3-resources/exercise)
2. **Create the Configuration File:** Create a file named `main.tf`.
3. **Required Providers**: Add a required providers with **aws** as a required provider block
4. **Define the Provider:** Inside `main.tf`, add an `aws` provider block and specify your desired `region` (e.g., `"us-east-1"`).
5. **Define the Resource:** Add an `aws_s3_bucket` resource block.
* Give it a local name (resource label) of `"my_exercise_bucket"`.
* Inside the block, set the `bucket` argument to a **globally unique name** (S3 bucket names must be unique across all of AWS).


6. **Initialize Terraform:** Run `terraform init` in your terminal to download the AWS provider.
7. **Review the Plan:** Run `terraform plan` to verify that Terraform intends to create exactly one S3 bucket.
8. **Deploy the Resource:** Run `terraform apply`. When prompted, type `yes` to confirm.
9. **Verify in AWS:** Log into the AWS Management Console and navigate to the S3 service to see your new bucket.
10. **Cleanup:** Run `terraform destroy` to remove the bucket and avoid any potential future costs.

---
