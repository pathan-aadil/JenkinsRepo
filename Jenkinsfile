pipline{
    stages{
        stage("chekout code stage"){
            step{
                git url:'https://github.com/pathan-aadil/JenkinsRepo.git', branch:'main'

            }

        }
        stage("Build Docker Image"){
            steps{
                sh'docker build -t myimage'
            }

        }
        stage{
            step{
                sh'docker run -d -p 8501:8501 myimage'
            }
        }
    }
}