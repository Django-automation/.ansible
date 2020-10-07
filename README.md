# completing-task
This task is related to Notejam (Django based) application automation.
The following steps should be completed.
**************************************************************  
1!)Create EC2 with ubuntu for notejam instalation (Notejam_ec2)
2!)connect with ssh, install django on it, download notejam app.
3)!create another ec2 with ubuntu for DB (DB_ec2)
4)connect with ssh, install psycorp on it
5)configure notejam to use DB on DB_ec2, run the notejam.
6)configure notejam to start automatically using system d
7)install ansible on blank ubuntu and get server with the same config as Notejam_ec2, using ansible roles (so getting Notejam_ec2_clone)
8)install packer on blank ubuntu (server), and create image AMI with packer which will include the same info as Notejam_ec2 (packer config should do: 1)install ansible and create 9)project directory with shell provisioner 2) copy project code from git with file provisioner 3 ) use absible provisioner for configuration of machine
10)use terraform on your server to create machine from the AMI, the state file should be in s3
11)use jenkins pipeline for the next steps - 1) create AMI with packer 2 ) Deploy on AWS with terraform 3 ) run smoke test  
**********************************************************************
