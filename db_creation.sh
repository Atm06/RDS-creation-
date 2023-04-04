#!/bin/bash

# Get user input for database credentials
echo "Enter database username:"
read username
echo "Enter database password:"
read -s password
echo "Enter database host:"
read host

# Create RDS database
aws rds create-db-instance \
    --db-instance-identifier mydatabase \
    --db-instance-class db.t2.micro \
    --engine mysql \
    --master-username $username \
    --master-user-password $password \
    --allocated-storage 10 \
    --no-publicly-accessible \
    --db-subnet-group-name default \
    --vpc-security-group-ids sg-12345678 \
    --availability-zone us-west-2a \
    --no-auto-minor-version-upgrade \
    --preferred-maintenance-window Mon:03:00-Mon:04:00 \
    --backup-retention-period 7 \
    --preferred-backup-window 02:00-03:00 \
    --no-enable-iam-database-authentication \
    --storage-type gp2 \
    --no-multi-az \
    --no-copy-tags-to-snapshot \
    --tags Key=Environment,Value=Dev \
    --db-name mydatabase \
    --region us-west-2 \
    --profile myprofile
