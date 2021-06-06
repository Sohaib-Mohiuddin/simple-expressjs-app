pipeline {
    environment {
        IMAGE_NAME = 'sohaibm/simple-expressjs-app'
        DOCKER_BUILD_PUSH = ''
    }
    agent any
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
                echo 'Building Image'
                DOCKER_BUILD_PUSH = docker.build("${IMAGE_NAME}:${params.VERSION}", '.')
                echo 'Building Image Complete'
            }
            
        }
        stage('Push Docker Image -> DockerHub') {
            steps {
                echo 'Pushing Docker Image'
                docker.withRegistry('', 'DockerHub') {
                    // app.push()
                    DOCKER_BUILD_PUSH.push()
                }
                echo 'Pushing Docker Image Complete -> DockerHub/sohaibm/simple-expressjs-app'
            }
            
        }
        stage('Prune Unused Images Tagged <None>') {
            steps {
                echo 'Pruning Dangling Images'
                sh "docker image prune -f"
                echo 'Removed Dangling Images'
            }
            
        }
    }

}
