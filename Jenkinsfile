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

        stage('Git Merge') {
            steps {
                echo 'Merge Part'
                script {
                    merge()
                }
            }
        }

        stage('Build') {
            steps {
                echo 'Jar File Merge Part'
                sh 'mvn clean package'
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

void merge() {
    sh 'git fetch origin'
    sh 'git checkout main'
    sh 'git pull origin main'
    sh "git merge ${GIT_BRANCH}"
}
