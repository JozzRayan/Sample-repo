pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'img-tf'
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    withCredentials([
                        [$class: 'AmazonWebServicesCredentialsBinding',
                        credentialsId: aws-secret-key,
                        accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                        secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']
                       
                    ]) {
                        sh "docker build -t ${DOCKER_IMAGE} --build-arg AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} --build-arg AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} ."
                    }
                }
            }
        }
    }
}
