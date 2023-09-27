pipeline {
    agent any
    stages {
        
        

       stage('Terraform Initialize') {
            steps {
               sh 'terraform init -no-color'
            }
        }

       stage('Terraform Plan') {
            steps {
                script{
               env.output = sh(script: "echo \$(terraform plan -no-color)", returnStdout: true)
                    echo "Output: ${output}"
               
                
                }   
            }
        }
       
    }
    post {
        always {
            echo 'This will always run'
        }
        success {
            echo 'This will run only if successful'
        }
        failure {
           emailext (
                to: '$DEFAULT_RECIPIENTS', 
                replyTo: '$DEFAULT_RECIPIENTS', 
                subject: 'Build Failed',
                body: '$DEFAULT_CONTENT',
                mimeType: 'text/html'
            );
        }
    }
}


