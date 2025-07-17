# MAPM
Moderately Available Product Management Tool

Hi!

I made this project because work needed a highly customized project management tool for our SLA Calculations. And since doing it in spreadsheets is BORING, I decided to self-host some applications to make it a bit more interesting.

## Concept
There are some requirements for this project:
1. The tools must be open-sourced and self-hosted (I want full ownership of all data)
2. All the data and configs must in a database that I own
3. As much of the infrastructure should be in AWS, but if it gets expensive, use my personal server at home
4. The services should be highly available
5. The services should be publicly accessible without opening up ports on my home network

<img width="945" height="657" alt="image" src="https://github.com/user-attachments/assets/5b2ae8bf-a55d-4da3-89e6-0edcef14d501" />

## Project Management UI

For this UI I decided to use NocoDB because of the following:
1. It connects straight to a database table, which saves time and energy for the integration
2. 

### 1. Main task tables
I got the product and task management setup the way I like it, each product has a one to many relationship with tasks, each with their own metadata, comments, and descriptions.
Grouped by team members
<img width="1306" height="593" alt="image" src="https://github.com/user-attachments/assets/43f794b8-f962-43c6-bcdd-ac5f083a9fc1" />

Grouped by product

<img width="636" height="707" alt="image" src="https://github.com/user-attachments/assets/62c1545e-c472-4138-b21d-a5901ac0aad3" />

Grouped by business unit
<img width="724" height="402" alt="image" src="https://github.com/user-attachments/assets/adfa128f-06cb-4025-bac5-a57a75570afd" />


### 2. Product overview & Registration
Kanban board for the product development lifecycle
<img width="1063" height="429" alt="image" src="https://github.com/user-attachments/assets/8277c64d-0d79-4e40-9b93-b2991ff9c876" />

Product registration form
<img width="669" height="694" alt="image" src="https://github.com/user-attachments/assets/2612da5a-1cd3-4bb5-a867-f749dec0d00f" />


### 3. User Management


## Executive Summary Dashboard



## Database
I chose to host my master database in AWS RDS using postgresql, because of the simple reason that it's in my free tier.
I also had a neondb free tier project already running, so I decided to use it as a read replica, just to test my postgres replication skills.

So I quickly setup a postgreSQL instance in Amazon RDS with 20GB's of storage.
<img width="1677" height="285" alt="image" src="https://github.com/user-attachments/assets/c0cb403b-c164-496a-85a6-a14cdd3974cd" />

I also created a database for this project in my neondb.

## Compute
The t2.micro EC2 instance is within my free tier, but its 1 GB RAM became a deal-breaker because Metabase alone needed 1.4GB RAM without traffic.
For this reason I decided to setup the whole project on my homelab first with 2Cores and 8GB of RAM.

### Homelab Setup
I had debian installed in an old PC I had lying around with the following specs
1. CPU: Intel i3 GEN 6
2. RAM: 8GB
3. Storage: 125GB NVME M2 + 500+GB HDD

This sucked as a in terms of availability since a power or network outage would just take down the services immediately, but as you will see, that won't be a problem in the future.
I decided to use this PC as the main server, with smaller EC2 instance as a failover in case the previously mentioned catastrophies occur.


