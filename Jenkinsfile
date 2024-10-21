pipeline {
    agent any

    environment {
        GIT_REPO_URL = 'https://github.com/tlakshan/hello-world-webapp.git'
        GIT_BRANCH = 'deployment'
    }

    stages {
        stage('vesion check')  {
            echo 'Version Checking Part'
            versionCheck()
        }

        stage('Git Merge') {
            echo 'Merge Part'
            merge()
        }
        stage('Build') {
            echo 'Jar File Merge Part'
            sh 'mvn clean package'
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

void merge() {
    sh 'git fetch origin'
    sh 'git checkout main'
    sh 'git pull origin main'
    sh 'git merge ${GIT_BRANCH}'
}