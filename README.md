# Highly Available Web Application Architecture on AWS

## Project Overview
Designed and deployed a highly available, fault-tolerant web server infrastructure on AWS capable of scaling dynamically based on user traffic spikes.

## Architecture Components
* **Network Infrastructure:** Custom VPC configured across 2 Availability Zones containing 2 Public Subnets.
* **Routing Strategy:** Application Load Balancer (ALB) managing public internet entries on HTTP Port 80.
* **Elastic Compute Engine:** Auto Scaling Group (ASG) maintaining a base capacity of 2 `t3.micro` EC2 instances.
* **High Availability Metric:** Auto-scaling monitoring policies triggered via CloudWatch target configurations set to 50% CPU boundaries.

