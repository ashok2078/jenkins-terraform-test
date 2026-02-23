pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo "Building from GitHub..."
                sh 'terraform --version'
                sh './test.sh'
                sh 'chmod +x test.sh && ./test.sh'
            }
        }
    }
}
