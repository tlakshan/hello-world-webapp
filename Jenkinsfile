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
    }
}

void versionCheck() {
    sh '''
        git version
        java -version
        mvn -version
    '''
}
