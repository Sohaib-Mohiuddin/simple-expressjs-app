pipeline {
    agent any
    def app

    stages {
        stage('Clone Repository') {
        // Clone repo into workspace
            steps {
                echo 'Cloning repository'
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image'
                app = docker.build("sohaibm/simple-expressjs-app")
            }
        }

        stage('Push Docker Image') {
            steps {
                echo 'Pushing Docker image to DockerHub'
                docker.withRegistry('https://registry.hub.docker.com', 'DockerHub') {
                    app.push("${env.BUILD_NUMBER}")
                    app.push("latest")
                }
            }
        }
    }
}
