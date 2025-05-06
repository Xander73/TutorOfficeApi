pipeline {
    agent any

    environment {
        IMAGE_NAME = 'tutor-office-api'
        CONTAINER_NAME = 'tutor-office-container'
        HOST_PORT = '8080'         // порт на хосте
        CONTAINER_PORT = '80'      // порт внутри контейнера, если твой API слушает 80
    }

    stages {
        stage('Checkout Source') {
            steps {
                git branch: 'master', url: 'https://github.com/yourusername/your-repo.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}")
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Остановить старый контейнер, если есть
                    sh "docker rm -f ${CONTAINER_NAME} || true"

                    // Запустить контейнер с пробросом порта
                    sh "docker run -d --name ${CONTAINER_NAME} -p ${HOST_PORT}:${CONTAINER_PORT} ${IMAGE_NAME}"
                }
            }
        }
    }

    post {
        always {
            echo 'TutorOffice API deployment complete.'
        }
    }
}
