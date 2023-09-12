pipeline {
    agent any

   

    stages {
        stage('Pull and Run Terraform Docker Image') {
            steps {
                // Define the Docker image name and tag
                //def dockerImage = 'hashicorp/terraform:latest'

                // Pull the Docker image from Docker Hub
                sh "docker pull hashicorp/terraform:latest"

                // Run a Docker container using the pulled image
                sh "docker run -it --rm hashicorp/terraform:latest terraform --version"
            }
        }

        stage('Code Checkout') {
            steps {
                script {
                    checkout(
                        scm: [
                            $class: 'GitSCM',
                            branches: [[name: '*/main']],
                            userRemoteConfigs: [[
                                credentialsId: 'github-access-token-1',
                                url: 'https://github.com/JozzRayan/tf-sample.git'
                            ]]
                        ]
                    )
                }
            }
        }

        stage('Terraform Infra') {
            steps {
                script {
                    def action = params.ACTION

                    // Navigate to the Dev directory and run Terraform commands with AWS credentials
                    dir('Environment/Dev') {
                        sh 'terraform init'
                        sh 'terraform plan'

                        if (action == 'deploy') {
                            sh 'terraform apply -auto-approve'
                        } else if (action == 'destroy') {
                            sh 'terraform destroy -auto-approve'
                        }
                    }
                }
            }
        }
    }
}
