  
                                                       **Terraform Web Platform – Multi-Environment Infrastructure**

This project is part of the HUG Ibadan 6 Weeks Terraform Challenge (Week 2).
The goal is to design a modular and reusable Terraform infrastructure that provisions a scalable web application platform with separate environments (Dev & Prod).

 -Project Structure:
 
terraform-web-platform/
├── .gitignore
├── environments/
│   ├── dev/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── terraform.tfvars
│   │   └── outputs.tf
│   └── prod/
│       ├── main.tf
│       ├── variables.tf
│       ├── terraform.tfvars
│       └── outputs.tf
├── modules/
│   ├── networking/
│   ├── compute/
│   ├── database/


.environments/ → Contains configuration for separate environments (dev & prod).
.modules/ → Reusable Terraform modules for networking, compute, and database resources.
.gitignore → Prevents sensitive files like state files and *.tfvars from being committed.


**Features:**

.Modular design for easy maintenance and scaling
.Separate environment configurations (Dev & Prod)
.Auto Scaling Group with Load Balancer for high availability
.RDS database integration
.Secure VPC networking with private & public subnets

  **Getting Started:**
  
```1️⃣ Clone the Repository

git clone https://github.com/<your-username>/terraform-web-platform.git
cd terraform-web-platform

2️⃣ Initialize Terraform

cd environments/dev   # or prod
terraform init

3️⃣ Plan the Infrastructure
terraform plan

4️⃣ Apply the Infrastructure
terraform apply

🔑 Requirements

Terraform >= 1.5

AWS CLI configured with proper credentials

An AWS account with permissions to create resources (VPC, EC2, RDS, ALB, etc.)

📌 Notes

State files are not committed thanks to .gitignore.

Variables are environment-specific and stored in terraform.tfvars.

Infrastructure can be destroyed using:

terraform destroy```
