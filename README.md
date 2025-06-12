# Terraform AWS EC2 NGINX Deployment

This project uses [Terraform](https://www.terraform.io/) to provision an **AWS EC2 instance** and configure it to run an **NGINX web server**. Ideal for learning infrastructure-as-code or as a base for a scalable web application.

## 📌 Features

- Infrastructure as Code with Terraform
- EC2 instance deployment on AWS
- Security group with open port 80 (HTTP)
- NGINX installed and running via `user_data`
- Modular structure (optional)

---

## 🧰 Requirements

- Terraform (>= 1.3.0)
- AWS CLI
- AWS credentials configured (`~/.aws/credentials` or environment variables)

---

## 🚀 Quick Start

### 1. Clone the Repo

```bash
git clone https://github.com/YOUR_USERNAME/terraform-ec2-nginx.git
cd terraform-ec2-nginx
