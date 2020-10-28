pipeline {
  agent any
  
  tools {
        'biz.neustar.jenkins.plugins.packer.PackerInstallation' "$packerTool"
    }
  
  stages {
    stage('Create AMI') {
        steps {
          withCredentials([
            usernamePassword(credentialsId: 'amazonka', passwordVariable: 'AWS_SECRET', usernameVariable: 'AWS_KEY')
          ]) {
            sh 'git clone https://github.com/Django-automation/completing-task.git'
            sh 'cd completing-task'
            sh '${tool packerTool}/packer build -var aws_access_key=${AWS_KEY} -var aws_secret_key=${AWS_SECRET} packer.json'
        }
      }
    }
    stage('Create EC2') {
      steps {
          withCredentials([
            usernamePassword(credentialsId: 'amazonka', passwordVariable: 'AWS_SECRET', usernameVariable: 'AWS_KEY')
          ]) {
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
