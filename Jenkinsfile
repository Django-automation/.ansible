pipeline {
  agent any
   
  stages {
        
    stage('Create AMI') {
        steps {
          withAWS(credentials: 'aws-credentials', region: 'us-west-1') {
            sh 'rm -rf completing-task'
            sh 'git clone https://github.com/Django-automation/completing-task.git'
            sh 'cd completing-task'
            sh 'packer build packer.json'
        }
      }
    }
    stage('Create EC2') {
      steps {
          withAWS(credentials: 'aws-credentials', region: 'us-west-1') {
            sh '''
               cd completing-task
               terraform init
               terraform apply -auto-approve -var access_key=${AWS_KEY} -var secret_key=${AWS_SECRET}
               }
            '''
       }
     }
   } 
  }
}
