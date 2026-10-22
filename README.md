# cloud-engineering-Project-1-Highly-Available-Web-App-on-AWS
# Project 1: Highly Available & Scalable Web Architecture on AWS

## 📌 Project Overview
Architected and deployed a highly available, fault-tolerant, and dynamically scalable web application infrastructure on AWS. This project demonstrates core cloud competencies in networking isolation, secure multi-AZ server distribution, automated load balancing, and auto-scaling configurations triggered by real-time infrastructure stress.

## 🏗️ Architecture Components
* **Virtual Private Cloud (VPC):** Formulated a custom network space (`10.0.0.0/16`) spanning **two physical Availability Zones** (AZs) for infrastructure redundancy, divided into Public Subnets to handle inbound traffic routes via an Internet Gateway (IGW).
* **Security & Firewalls (Security Groups):** Implemented a layered firewall model enforcing least-privilege entry points:
  * `alb-sg`: Open to the public internet exclusively on **HTTP Port 80**.
  * `ec2-sg`: Strictly locked down to **only** accept inbound traffic originating from the Load Balancer security group (`alb-sg`), neutralizing direct public attack vectors on backend instances.
* **Launch Template:** Engineered an automated blueprint utilizing an Amazon Linux 2023 AMI. Embedded a custom shell execution script (**User Data**) to automatically update packages, initialize the Apache HTTP server, and generate a dynamic hostname web page upon compute provision.
* **Application Load Balancer (ALB):** Implemented an internet-facing ALB mapping across public subnets, conducting active HTTP health checks on a backend target group (`web-tg`) to distribute incoming traffic seamlessly.
* **Auto Scaling Group (ASG):** Configured an elastic scaling cluster with a base deployment of **2 minimum/desired instances** distributed across multiple AZs to ensure zero downtime.

## ⚡ Stress Testing & High Availability Verification
1. **Automated Scale-Out Simulation:** Injected a continuous computation loop inside the server launch sequence to deliberately manipulate metric boundaries.
2. **CloudWatch Alarm Activation:** The computing spike successfully violated the **Target Tracking Policy (Set at 50% CPU utilization)**, triggering an automated scaling response.
3. **Dynamic Scaling Elasticity:** The ASG successfully processed the metrics and provisioned additional instance capacity automatically to mitigate the resource deficit.

## 📂 Repository Artifacts
* `README.md` - Documentation of architecture and deployment strategy.
* `user-data.sh` - Automated installation script for Apache web deployment.

## 📸 Deployment & Scaling Verification

### 1. Live Web Server Verification via ALB DNS:
<img width="1440" height="841" alt="Screenshot (1)" src="https://github.com/user-attachments/assets/70222b97-5b9d-4de6-91dd-97355ae2fdb6" />

### 2. Auto Scaling Group Dynamic Scale-Out Logs:
<img width="1440" height="838" alt="Screenshot (2)" src="https://github.com/user-attachments/assets/b1365d91-daa7-48f9-b70d-aa6a1dd0230e" />


