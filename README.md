# Networking Assignment

## Overview

This assignment demonstrates the process of registering a custom domain, deploying a web server on an Amazon EC2 instance, and mapping the domain to the hosted application using AWS services.

---

## Task Objectives

- Register a custom domain  
- Launch an EC2 instance  
- Install and run Nginx on the instance  
- Map the domain to the EC2 instance using DNS  

---

## Registering a Domain

- Amazon Route 53 was used to purchase and manage the domain.
- The registered domain is **abdulqayoom.co.uk**.

<img width="600" height="793" alt="Route 53 Domain Registration" src="https://github.com/user-attachments/assets/f2f42e34-7de8-4904-ae01-da00435acf3f" />

---

## Launching an EC2 Instance

- An EC2 instance was launched using **Amazon Linux 2**.

<img width="600" height="218" alt="EC2 Instance Overview" src="https://github.com/user-attachments/assets/594f246f-135b-4c2a-8b06-e5ef1deeed00" />

- The instance was accessed using **EC2 Instance Connect**.

<img width="600" height="807" alt="EC2 Connect" src="https://github.com/user-attachments/assets/5f580fc4-792a-4a96-95df-98c7cc2865df" />

- The security group was configured to allow inbound traffic for:
  - **HTTP (port 80)**
  - **SSH (port 22)**

<img width="600" height="352" alt="Security Group Rules" src="https://github.com/user-attachments/assets/0261b1a9-2836-4582-9f3c-ea5034624a8c" />

---

## Installing and Running Nginx on Instance

Nginx was installed and started using the following commands:

```bash
sudo yum install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx
```
  
<img width="600" height="1016" alt="Screenshot 2026-01-03 024606" src="https://github.com/user-attachments/assets/c8e0f5f7-3f3f-41bf-95f3-5b8d12962cfd" />

### Mapping the domain to the EC2 Instance
- Record to the DNS to map my domain abdulqayoom.co.uk -> nginx homepage.
- The configuration was tested in the AWS Console.

<img width="600" height="642" alt="DNS Configuration" src="https://github.com/user-attachments/assets/aab87fed-caaf-430c-95fe-72d416ed5675" />

- The domain was also tested in a web browser to confirm successful routing to the Nginx default homepage.

<img width="600" height="1018" alt="Browser Test" src="https://github.com/user-attachments/assets/b7e53d93-eb7d-4e58-bc45-dd7a097d14d2" />

