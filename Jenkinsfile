node {
    def app

    stage('Clone Repository') {
    // Clone repo into workspace
        echo 'Cloning repository'
        checkout scm
    }

    stage('Build Docker Image') {
        echo 'Building Docker image'
        app = docker.build("sohaibm/simple-expressjs-app")
    }

    stage('Push Docker Image') {
        echo 'Pushing Docker image to DockerHub'
        docker.withRegistry('https://registry.hub.docker.com', 'DockerHub') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}
