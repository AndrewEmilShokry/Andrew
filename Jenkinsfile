pipeline {
    agent any

    environment {
        IMAGE_NAME = "mywebsite"
        TAG = "latest"
        OUTPUT_FILE = "mywebsite.tar"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/AndrewEmilShokry/Andrew.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${IMAGE_NAME}:${TAG} ."
                }
            }
        }

        stage('Save Image to File') {
            steps {
                script {
                    sh "docker save -o ${OUTPUT_FILE} ${IMAGE_NAME}:${TAG}"
                }
            }
        }

        stage('Archive for Download') {
            steps {
                archiveArtifacts artifacts: "${OUTPUT_FILE}", fingerprint: true
            }
        }
    }

    post {
        success {
            echo "Image saved as ${OUTPUT_FILE}. You can download it from Jenkins now."
        }
    }
}
