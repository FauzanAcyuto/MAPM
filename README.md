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

This sucked as a high availability server since a power or network outage would just take down the services immediately, but as you will see, that won't be a problem in the future.
I decided to use this PC as the main server, with smaller EC2 instance as a failover in case the previously mentioned catastrophies occur.


