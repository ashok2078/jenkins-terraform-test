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
                // Permission fix ke baad ye chal jayega
                sh 'docker ps'
            }
        }
        stage('Docker Build & Run') {
            steps {
                // 1. Purana container delete karo agar pehle se chal raha hai
                sh 'docker rm -f my-web-app || true'
                
                // 2. Dockerfile ka use karke Image banao
                sh 'docker build -t my-custom-web-image .'
                
                // 3. Image ko container ke roop mein chalao (Port 8081 par)
                sh 'docker run -d -p 8081:80 --name my-web-app my-custom-web-image'
            }
        }
    } 
}
