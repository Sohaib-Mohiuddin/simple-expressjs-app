def docker_build_push

pipeline {
    environment {
        IMAGE_NAME = 'sohaibm/simple-expressjs-app'
        VERSION = '1.2'
    }
    agent any
    stages {
        stage('Build Docker Image') {
            steps {
                echo 'Building Image'
                script {
                    docker_build_push = docker.build("${IMAGE_NAME}:${VERSION}", '.')
                }
                echo 'Building Image Complete'
            }
            
        }
        stage('Push Docker Image -> DockerHub') {
            steps {
                echo 'Pushing Docker Image'
                script {
                    docker.withRegistry('', 'DockerHub') {
                        docker_build_push.push()
                    }
                }
                
                echo "Pushing Docker Image Complete -> DockerHub/sohaibm/simple-expressjs-app:${VERSION}"
                
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
