## Tf state usage

This exercise uses a **Security Group**. It is a great choice for state exercises because it generates a unique ID (like `sg-0abc123...`) immediately upon creation, and you can easily see how Terraform tracks that specific cloud identifier.

---

### 1. The Terraform File (`main.tf`)

This main.tf file in this directory creates a Security Group in your default VPC.

### 2: Initialize and Deploy

Run the standard workflow to create the resource:

* `terraform init`
* `terraform apply -auto-approve`

### 3: Locate the Cloud ID

Once the apply finishes, look at your terminal. The `output` will show you the AWS-assigned ID (e.g., `sg-0123456789abcdef`). This is the "Real World" identifier.

### 4: Find the ID inside the State

Now, ask Terraform to show you what it knows about this resource:

* **Command:** `terraform state show aws_security_group.state_exercise`
* **Observation:** Look for the line that says `id = "sg-..."`. This confirms that Terraform has mapped your HCL code to that specific AWS resource ID.

### 5: List State Members

If you have a large project, you can quickly see all IDs without the full detail:

* **Command:** `terraform state list`
* **Then try:** `terraform state show -id=sg-YOUR_ID_HERE` (Replace with your actual ID).

### 6: Manual "Drift" Test

Go to the **AWS Console**, find this Security Group, and manually change the Description or add a new Tag.

* **Now run:** `terraform plan`
* **Observation:** Terraform will show that the "State" (its memory) no longer matches the "Real World." It will propose an "Update in-place" to fix it.

### 7: Forget the Resource

What if you want to keep the resource in AWS but stop managing it with Terraform?

* **Command:** `terraform state rm aws_security_group.state_exercise`
* **Observation:** Run `terraform state list`. The resource is gone from the list. However, if you check the AWS Console, the Security Group still exists!

### 8: Cleanup

Since you "forgot" the resource in Step 6, a normal `terraform destroy` won't work. To clean up:

1. Delete the Security Group manually in the AWS Console.
2. Or, use `terraform import aws_security_group.state_exercise sg-YOUR_ID` to bring it back under management before destroying.

---

