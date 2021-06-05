pipeline {
    agent any
    def app
    parameters {
        string(name: 'VERSION', defaultValue: '', description: 'Version of image being pushed to DockerHub/sohaibm. Add incremental version number.')
    }
    stages {
        stage('Clone Repository') {
            steps {
                // Clone repo into workspace
                echo 'Cloning repository'
                checkout scm
            }
            
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image'
                app = docker.build("sohaibm/simple-expressjs-app:${params.VERSION}", '.')
            }
            
        }

        stage('Push Docker Image') {
            steps {
                echo 'Pushing Docker image to DockerHub'
                docker.withRegistry('https://registry.hub.docker.com', 'DockerHub') {
                    app.push()
                }
            }
            
        }
    }

}
