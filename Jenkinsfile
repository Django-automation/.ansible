pipeline {
  agent any
   
  stages {
        
    
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
