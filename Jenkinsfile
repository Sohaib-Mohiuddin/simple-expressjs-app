pipeline {
    agent any
    parameters {
        string(name: 'VERSION', defaultValue: '', description: 'Version of image being pushed to DockerHub/sohaibm. Add incremental version number.')
    }
    stages {
        stage('Clone Repository') {
            steps {
                // Clone repo into workspace
                echo 'Cloning repository'
                // checkout scm
            }
            
        }
        stage('Build & Push Docker Image') {
            steps {
                echo 'Building Docker Image'
                // docker.withRegistry('https://registry.hub.docker.com', 'DockerHub') {
                //     app.push()
                //     docker.build("sohaibm/simple-expressjs-app:${params.VERSION}", '.').push()
                // }
                echo 'Pushed Docker image to DockerHub'
            }
            
        }
    }

}
