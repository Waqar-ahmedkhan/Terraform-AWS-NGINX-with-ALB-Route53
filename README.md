# 🌐 Terraform AWS NGINX with ALB & Route53

This project demonstrates how to provision a production-ready **NGINX web server** on **AWS EC2**, fronted by an **Application Load Balancer (ALB)**, and accessible via a **custom domain name through Route53** using **Terraform**.

---

## 📦 Features

✅ EC2 Instance with Ubuntu + NGINX Setup
✅ Application Load Balancer (ALB) with HTTP Listener
✅ Security Groups for EC2 and ALB with strict rules
✅ Auto DNS Registration using Route53
✅ IAM Roles & Instance Profile for Secure Access
✅ Modular & Scalable Terraform Structure
✅ Automated Provisioning using Terraform CLI

---

## 🧰 Tech Stack

* **Terraform** v1.3+
* **AWS** EC2, ALB, IAM, Route53
* **NGINX** web server
* **Ubuntu** Linux (AMI)

---

## 📁 Project Structure

```
terraform-nginx-aws-dns-routing/
│
├── alb/                   # ALB configuration (target group, listener)
├── ec2-instance/         # EC2 & NGINX setup with user_data
├── iam/                  # IAM roles and instance profiles
├── route53/              # Hosted zone and DNS record creation
├── security-group/       # Custom security groups for EC2 and ALB
├── main.tf               # Root Terraform entry point
├── variables.tf          # Global variables
├── outputs.tf            # Output values (public IP, DNS, etc)
└── README.md             # Project documentation
```

---

## 🚀 Quick Start Guide

### 1. Clone the Repository

```bash
git clone https://github.com/Waqar-ahmedkhan/terraform-nginx-aws-dns-routing.git
cd terraform-nginx-aws-dns-routing
```

### 2. Set Up AWS Credentials

Ensure you have your AWS credentials configured via `~/.aws/credentials` or environment variables:

```bash
export AWS_ACCESS_KEY_ID=your_access_key
export AWS_SECRET_ACCESS_KEY=your_secret_key
```

### 3. Initialize Terraform

```bash
terraform init
```

### 4. Customize Variables

Update `variables.tf` or pass your own values using `terraform.tfvars`.

### 5. Apply Terraform Configuration

```bash
terraform apply
```

Type `yes` when prompted.

### 6. Access Your Website

After deployment, Terraform will output the **public DNS** and **domain name**. Visit it in your browser.

---

## 🔐 Security

* Only port `80` is open to the internet (HTTP)
* IAM roles follow **least-privilege** principle
* Custom security groups for ALB and EC2

---

## 🧹 Clean Up Resources

To destroy all AWS resources created:

```bash
terraform destroy
```

---

## 🤝 Contributing

Pull requests are welcome! For major changes, please open an issue first to discuss what you would like to change.

---

## 📄 License

This project is open-source and available under the [MIT License](LICENSE).

---

## ✨ Author

**Waqar Ahmed**
📧 [waqarahmedkhan.dev@gmail.com](mailto:waqarahmedkhan.dev@gmail.com)
🌐 [GitHub](https://github.com/Waqar-ahmedkhan)

---

> "Deploy infrastructure with confidence. Embrace the power of Terraform!"
