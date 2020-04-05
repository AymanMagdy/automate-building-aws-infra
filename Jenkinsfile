pipeline {
    agent any

    stages {
        stage('Terraform init') {
            steps {
                echo 'From the teraform init stage..'
                echo 'The current dir: ${pwd}'
                sh "terraform init -var access_key='${env.AWS_ACCESS_KEY_ID}' -var secret_access_key='${env.AWS_SECRET_ACCESS_KEY}'"
            }
        }
        stage('Terraform plan') {
            steps {
                echo 'From the terraform plan stage..'
                sh 'terraform plan'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Applying the infrastructure stage..'
                sh 'terraform apply -auto-approve'
            }   
        }
    }
}