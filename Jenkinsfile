pipeline {
    agent any

    environment {
        GIT_REPO_URL = 'https://github.com/tlakshan/hello-world-webapp.git'
        GIT_BRANCH = 'deployment'
    }

    stages {
        stage('Version Check')  {
            steps {
                echo 'Version Checking Part'
                script {
                    versionCheck()
                }
            }
        }
        stage('Build') {
            steps {
                echo 'Jar File Merge Part'
                sh 'mvn clean package'
            }
        }
        stage('Image Build') {
            steps {
                echo 'Docker Image Build Part'
                sh 'docker compose build'
                sh 'docker compose push'
            }
        }
        stage('Deployment') {
            steps {
                echo 'Deployment part'
                sh 'ssh root@192.168.132.209'
                sh 'scp docker-compose.yml root@192.168.132.209:/home/'
                sh 'cd /home/'
                sh 'docker compose up -d'
            }
        }
    }
}

void versionCheck() {
    sh '''
        git version
        java -version
        mvn -version
    '''
}
