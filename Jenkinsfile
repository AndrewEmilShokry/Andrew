pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'andrewfeeder/jenkins-project'
        TAG = "${env.BUILD_NUMBER}"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/AndrewEmilShokry/Andrew.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE}:${TAG}")
                }
            }
        }

        stage('Test (Optional)') {
            steps {
                echo '✅ No automated tests added. Skipping this step.'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-login') {
                        docker.image("${DOCKER_IMAGE}:${TAG}").push()
                    }
                }
            }
        }
    }

    post {
        success {
            echo "✅ Successfully pushed Docker image: ${DOCKER_IMAGE}:${TAG}"
        }
        failure {
            echo "❌ Pipeline failed. Please check logs."
        }
    }
}
