pipeline {
  agent any
   
  stages {
        
    
    stage('Create EC2') {
      steps {
          withAWS(credentials: 'aws-credentials', region: 'us-west-1') {
            sh '''
               terraform init
               terraform apply -auto-approve
               }
            '''
       }
     }
   } 
  }
}
