def docker_build_push

pipeline {
    environment {
        IMAGE_NAME = 'sohaibm/simple-expressjs-app'
        VERSION = '1.1'
    }
    agent any
    // parameters {
    //     string(name: 'VERSION', defaultValue: '', description: 'Version of image being pushed to DockerHub/sohaibm. Add incremental version number.')
    // }
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
                docker_build_push = docker.build("${IMAGE_NAME}:${VERSION}", '.')
                echo 'Building Image Complete'
            }
            
        }
        stage('Push Docker Image -> DockerHub') {
            steps {
                echo 'Pushing Docker Image'
                docker.withRegistry('', 'DockerHub') {
                    // app.push()
                    docker_build_push.push()
                }
                echo "Pushing Docker Image Complete -> DockerHub/sohaibm/simple-expressjs-app:${VERSION}'
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
