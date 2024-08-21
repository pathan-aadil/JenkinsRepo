pipeline {
    agent any
    
    stages {
        stage('Checkout code') {
            steps {
                git url: 'https://github.com/pathan-aadil/JenkinsRepo.git', branch: 'main'
            }
        }
        /*stage('cleanup stage') {
            steps {
                sh 'docker rmi -f myimage'
                sh 'docker rm -f $(docker ps -aq)'
            }
        }*/
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t myimage:latest .'
            }
        }
       stage('Build and Push Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
                    sh 'docker tag myimage:lates $DOCKER_USERNAME/myimage:latest'
                    sh 'docker push $DOCKER_USERNAME/myimage:latest'
                }
                   
            }
        }
        stage('Kubernetes deployment stages') {
            steps {
                sh 'kubectl apply -f my-deployment.yml'
            }
        }
    }
}
