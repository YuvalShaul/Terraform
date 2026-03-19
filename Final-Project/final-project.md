## Project: The Unified Web Cluster

Expected Result:  
We are creating two AWS web servers (one running Docker, one running native Nginx) that both serve a single index.html file hosted on a shared EFS volume. Both websites will display the same image fetched directly from a public S3 bucket. If you modify the file on the EFS mount of Server A, the change will appear instantly on Server B.

#### Infrastructure Setup 
Create 2 terraform modules:
- **Networking Module**: Defines a VPC, public subnets, and an Internet Gateway.
- **Compute & Storage Module**: 
  - S3 Bucket: Create a bucket and upload a sample image (e.g., logo.png).
  - EFS File System: Create the file system and Mount Targets in your subnets.
  - EC2 Instances: Deploy two instances with Security Groups allowing HTTP (80) and NFS (2049) traffic.

#### The "Shared Content" Logic
Your User Data (init scripts) should achieve the following without manual intervention:

- Step 1 (Both Servers): Install the amazon-efs-utils package and mount the EFS volume to a local directory (e.g., /mnt/efs).

- Step 2 (Seeding): Only one of the servers should run a command to create the index.html file inside the EFS mount.  
Note: The HTML must include an <img> tag pointing to your S3 Object URL.

- Step 3 (The Servers):
  - Instance A (Docker): Install Docker. Run an Nginx container using a volume mapping (-v) that points the container’s web root to your EFS mount.

  - Insance B (Native): Install Nginx. Use a symbolic link or change the Nginx configuration to point its root directory to the EFS mount.

#### Verification Steps
- Dual Access: Open both EC2 Public IPs in your browser. You should see the exact same page and image.

- The "Live Edit" Test: SSH into Instance A, edit the HTML file on the EFS mount, and refresh Instance B’s IP in your browser. The change should be visible immediately.

- Persistence Test: Use terraform destroy on just the EC2 instances(find how to do this!), then terraform apply. The new instances should automatically reconnect to the EFS and serve the same website without you re-uploading the HTML.

#### Suggested Terraform Outputs
To make testing easier, configure your outputs.tf to show:

- server_a_public_ip

- server_b_public_ip

- s3_image_url
