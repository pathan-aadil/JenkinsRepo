pipeline{
    agent {
        node{
            label 'JenkinsSlaveNodeLabel'
        }
    }
    stages{
        stage('Chekout Code Stage'){
            steps{
                git url:'https://github.com/pathan-aadil/JenkinsRepo.git', branch:'main'
            }
        }
        stage("Build Docker Image"){
            steps{
                sh 'docker build -t myimage .'
            }
        }
        stage('Creat Container'){
            steps{
                sh 'docker run -d -p 8501:8501 myimage'
            }
        }
    }
}