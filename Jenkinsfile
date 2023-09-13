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
                script {
                    def terraformImage = docker.image('hashicorp/terraform:latest')
                    terraformImage.inside('-v $PWD:/terraform-project --entrypoint ""') { c ->
                        /* Run Terraform commands here */
                        sh 'terraform --version'
                        sh 'terraform init'
                        sh 'terraform plan'
                    }
                }
            }
        }

        // stage('Terraform Infra') {
        //     steps {
        //         script {
        //             def action = params.ACTION

        //             // Navigate to the Dev directory and run Terraform commands with AWS credentials
        //             dir('.'){
        //                 sh 'terraform init'
        //                 sh 'terraform plan'

        //                 if (action == 'deploy') {
        //                     sh 'terraform apply -auto-approve'
        //                 } else if (action == 'destroy') {
        //                     sh 'terraform destroy -auto-approve'
        //                 }
        //             }
        //         }
        //     }
        // }
    }
}
