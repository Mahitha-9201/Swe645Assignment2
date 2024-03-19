
pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    }
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t mahitha9201/studentsurveyform:latest .'
            }
        }
        stage('Login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage("Push image to Docker Hub") {
            steps {
                sh 'docker push mahitha9201/studentsurveyform:latest'
            }
        }
        stage("Deploying on Kubernetes") {
            steps {
                sh 'kubectl set image deployment/swe645assignment2 container-0=mahitha9201/studentsurveyform:latest -n default'
                sh 'kubectl rollout restart deploy swe645assignment2 -n default'
            }
        }
    }
    post {
        always {
            sh 'docker logout'
        }
    }
}



