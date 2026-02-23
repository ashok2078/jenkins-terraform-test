pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo "Building from GitHub..."
                sh 'terraform --version'
                
                // Pehle file ko executable banayein, phir run karein
                sh 'chmod +x test.sh'
                sh './test.sh'
            }
        }
    }
}
