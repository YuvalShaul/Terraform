### **Exercise: Dynamic Subnet Discovery**

In this exercise, you will use a **Data Source** to discover existing subnets in a VPC without knowing their IDs. This is a common real-world scenario where you need to deploy an application into a pre-existing network environment.

#### **Scenario**

You need to find all **private subnets** within a specific VPC that are currently "available" and located in a specific Availability Zone.

---

### **1. The "Filter" Logic**

When using the `filter` block, the `name` field must match the **AWS API filter names** (which are often different from the Terraform resource argument names).

* **To filter by Tag:** Use `tag:KeyName` (e.g., `tag:Environment`).
* **To filter by VPC:** Use `vpc-id`.
* **To filter by State:** Use `state`.

---

### **2. Exercise Instructions**

#### **Step 1: Look up the VPC**

Instead of hardcoding a VPC ID, use the `aws_vpc` data source to find the VPC tagged with `Name = "production-vpc"`.

#### **Step 2: Filter for Private Subnets**

Use the `aws_subnets` (plural) data source to fetch a list of IDs. Apply the following filters:

1. **VPC Filter:** Ensure the subnets belong to the VPC found in Step 1.
2. **Tag Filter:** Only include subnets where the tag `Tier` is set to `Private`.
3. **State Filter:** Only include subnets that are `available`.

#### **Step 3: Get Specific Subnet Details**

The `aws_subnets` data source only returns a list of IDs. To get the CIDR block of the *first* subnet in that list, use the singular `aws_subnet` data source and pass the first ID from your list.

#### **Step 4: Output the Result**

Create an output to display the CIDR block of that discovered private subnet.

---

### **3. Filtering Cheat Sheet**

| Goal | Filter `name` | Example `values` |
| --- | --- | --- |
| **Specific Tag** | `tag:Name` | `["frontend-subnet-*"]` (Supports wildcards!) |
| **VPC Membership** | `vpc-id` | `["vpc-0a1b2c3d"]` |
| **Public vs Private** | `map-public-ip-on-launch` | `["false"]` (for private) |
| **Availability Zone** | `availability-zone` | `["us-east-1a"]` |

