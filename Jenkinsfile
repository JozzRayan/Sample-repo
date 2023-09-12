pipeline {
    agent any

   

    stages {
        

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

        stage('Pull and Run Terraform Docker Image') {
            steps {
                // Run a Docker container using the pulled image with volume and user
                // Define the Docker image name and tag
                def dockerImage = 'hashicorp/terraform:latest'

                // Use the Jenkins workspace as the code path
                def workspacePath = pwd()

                // Define the container work directory
                def workDir = '/terraform/project'

                // Run a Docker container using the pulled image with mounted workspace
                sh """
                    docker run -it --rm \\
                    -v ${workspacePath}:${workDir} \\
                    -w ${workDir} \\
                    ${dockerImage} terraform --version
                """
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
