Bash (Task #1)

Title: Create scenario to change the owner of files and folders
Parameters: 
$1 <username>
$2 <directory>
Requirements:
$1 - should be existing user in your OS (in your script the checking block should be present)
$2 - should be only the directory (also need to be checked in your script)


Task_2
Prepare Environment for deploying LMS Moodle (LAMP Stack)
Requirements
1 server (2 GiB RAM, 1 vCPU, 10 GiB)
Task 2.1
Install MySQL 5.7.x (Mariia DB)
https://www.digitalocean.com/community/tutorials/mysql-ubuntu-18-04-ru
Create user on mysql server for specific db (which will be user for LMS Moodle)
Create database for LMS Moodle
Assign grant permission on database which created on step 3 for user which was created on step 2 (example present in pptx file)
Create bash script for making dump of database and write this dump to the file with name like following: moodle_<currentdate_currenttime>.sql

Task_4
Create terraform scenario for provisioning infrastructure on GCP (or AWS) cloud
Requirement
Create one instance (image: ubuntu 20.04)
Allow HTTP/HTTPS traffic on a NIC
Provision one SSH public key for created instance
Install Web Server (Apache HTTP Server) via bash scenario

Task_5
Create Dockerfile for image definition (Apache HTTP Server).
Requirement
Basic image: Alpine Linux: https://hub.docker.com/_/alpine
Add layer with Apache HTTP Server (you need to install HTTP Server)
Change default index.html file. 
Use simple web page like <h1>Hello World!</h1>
Build your recently created image
Create and run container with Apache HTTP Server

