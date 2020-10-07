# completing-task
This task is related to Notejam (Django based) application automation.
The following steps should be completed.
**************************************************************  
ok-1)Create ec2 with ubuntu for DB (DB_ec2), connect with ssh, install PostgreSQL on it, start DB service, allow access outside.
ok-2) Create EC2 with ubuntu for notejam instalation (Notejam_ec2),connect with ssh, Install Notejam, configure DB, and launch.
3)configure notejam to start automatically using system d
4)install ansible on blank ubuntu and get server with the same config as Notejam_ec2, using ansible roles (so getting Notejam_ec2_clone)
5)install packer on blank ubuntu (server), and create image AMI with packer which will include the same info as Notejam_ec2 (packer config should do: 1)install ansible and create project directory with shell provisioner 2) copy project code from git with file provisioner 3 ) use absible provisioner for configuration of machine
6)use terraform on your server to create machine from the AMI, the state file should be in s3
7)use jenkins pipeline for the next steps - 1) create AMI with packer 2 ) Deploy on AWS with terraform 3 ) run smoke test  
**********************************************************************
