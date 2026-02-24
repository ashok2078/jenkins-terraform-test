pipeline {
    agent any
    stages {
        stage('Build & Test') {
            steps {
                echo "Running Terraform and Tests..."
                sh 'terraform --version'
                sh 'chmod +x test.sh'
                sh './test.sh'
            }
        }
        stage('Docker Deploy') {
            steps {
                echo "Deploying Docker Container on Port 8081..."
                // 1. Purana container clean karna (agar exist karta hai)
                sh 'docker rm -f my-web-app || true'
                
                // 2. Nayi image build karna
                sh 'docker build -t my-custom-web-image .'
                
                // 3. Container run karna Port 8081 par
                sh 'docker run -d -p 8081:80 --name my-web-app --restart always my-custom-web-image'
            }
        }
    }
}
