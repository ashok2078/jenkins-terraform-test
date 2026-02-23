pipeline {
    agent any
    stages {
        stage('Build & Test') {
            steps {
                echo "Building from GitHub..."
                sh 'terraform --version'
                sh 'chmod +x test.sh'
                sh './test.sh'
            }
        }
        stage('Docker Check') {
            steps {
                // Ye wahi line hai jo error degi (Permission Denied)
                // Hum ise जान-बूझकर add kar rahe hain troubleshoot seekhne ke liye
                sh 'docker ps'
            }
        }
    } // stages ka bracket
} // pipeline ka bracket
