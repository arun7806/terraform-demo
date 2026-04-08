pipeline {
    agent any

    tools {
        maven 'mvn3.9.14'
    }

    environment {
        DOCKER_IMAGE = 'new-work'
        CONTAINER_NAME = 'new-work-container'
    }
    parameters {
    choice(name: 'ENV', choices: ['testing', 'prod'], description: 'environment')
}

    stages {
        stage('Git Clone') {
            steps {
                git branch: 'newbranch',
                    credentialsId: 'github-arun',
                    url: 'https://github.com/arun7806/terraform-demo.git'
            }
        }

        stage('Maven Test') {
            steps {
                bat 'cd /d demo && mvn test'
            }
        }

        stage('Maven Build') {
            steps {
                bat 'cd /d demo && mvn clean install -DskipTests=true'
            }
        }

        stage('Docker Build') {
            steps {
                bat 'cd /d demo && docker build -t %DOCKER_IMAGE%:2.0 .'
            }
        }

        stage('Docker Run') {
            steps {
                bat 'docker rm -f %CONTAINER_NAME% || exit /b 0'
                bat 'docker run -d -p 8080:8080 --name %CONTAINER_NAME% %DOCKER_IMAGE%:2.0'
            }
        }
    }
}
