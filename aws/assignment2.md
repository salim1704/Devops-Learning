# Assignment 2 – Application Load Balancer (ALB)

## Overview

This project demonstrates a common production-grade DevOps architecture:  
**multiple EC2 instances deployed behind an Application Load Balancer (ALB).**

The ALB acts as the single public entry point to the application, while the EC2 instances remain isolated and are only reachable through the load balancer. This setup provides **high availability, scalability, and security**.

---
## Objective

Deploy two EC2 instances behind an ALB. The ALB must handle all incoming traffic. EC2 instances should not be accessible directly from the internet.

## Architecture

Users access the application through the domain name that routes to the Application Load Balancer via internet gateway, which routes requests to healthy EC2 instances running in different Availability Zones. 

![Architecture Diagram](screenshots-2/assignment_2_AD.png)

---

## EC2 Instances

Two EC2 instances were launched in the same VPC but in different Availability Zones.

Each instance:

* Returns different content to identify which instance handled the request

* Has no public IP address

* Uses a security group that only allows HTTP access from the ALB

* Runs a simple web server installed using the following user-data

```
#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
```

--- 

## Application Load Balancer

<img width="1918" height="470" alt="05_Multi_AZ_ALB" src="https://github.com/user-attachments/assets/ebeea1c2-6ab9-46a6-8c23-9e8a42e75db8" />


An Application Load Balancer was created with:

* Internet-facing configuration

* Two public subnets (one in each Availability Zone)

* An HTTP listener on port 80

* A default rule forwarding traffic to a target group

## Target Group

A target group was configured to:

* Use HTTP on port 80

* Register both EC2 instances

* Perform health checks on the root path /

* Only healthy instances receive traffic from the ALB.

<img width="1572" height="430" alt="04_Target_Group" src="https://github.com/user-attachments/assets/10261061-7899-4274-986d-a57f98449d28" />



## DNS 
* Configured a custom domain using Route53 DNS
* Mapped the domain to the ALB DNS name by creating an ALIAS record type
<img width="1915" height="716" alt="08_DNS_Record" src="https://github.com/user-attachments/assets/186640d9-9614-4db5-bf45-1387f7439a85" />


## Testing 
* Verified access via alb domain
* Verified access via the custom domain name
* In both the alb domain and custom domain name, when page was refreshed a few times the content on the page change to show the alb taking effect.

[Screenshot of this can be found here](screenshots-2)


## Conclusion
This project demonstrates a real-world AWS architecture where an Application Load Balancer distributes incoming traffic across multiple EC2 instances while keeping backend servers securely isolated. It reflects how production web applications are designed for reliability, scalability, and security.


## Key Takeaways
* An Application Load Balancer acts as a single public entry point and distributes traffic across multiple EC2 instances.

* Target Groups and health checks ensure that only healthy instances receive traffic, improving reliability.

* Deploying instances across multiple Availability Zones increases availability and fault tolerance.

* Security Groups can be used to strictly control traffic flow, allowing internet access only through the load balancer.

* EC2 instances can be fully isolated from the internet while still serving public traffic through an ALB.

* Using Route 53 ALIAS records allows custom domain names to point to AWS load balancers without exposing IP addresses.
