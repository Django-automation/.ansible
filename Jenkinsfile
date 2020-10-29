pipeline {
  agent any
   
  stages {
    
      
    stage('Create AMI') {
        steps {
          withAWS(credentials: 'aws-credentials', region: 'us-west-1') {
            sh 'rm -rf completing-task'
            sh 'git clone https://github.com/Django-automation/completing-task.git'
            sh 'cd completing-task'
            sh 'packer build -var aws_access_key=${AWS_KEY} -var aws_secret_key=${AWS_SECRET} packer.json'
        }
      }
    }
  }
}
