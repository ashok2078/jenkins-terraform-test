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
                sh 'docker ps'
            }
        }
        stage('Docker Build & Run') {
            steps {
                // 1. Purana container delete karein (agar hai toh), nahi hai toh error ignore karein
                sh 'docker rm -f my-web-app || true'
                
                // 2. Nayi image banayein (Ab ye 'Dockerfile' ko dhund lega)
                sh 'docker build -t my-custom-web-image .'
                
                // 3. Container run karein port 8081 par
                sh 'docker run -d -p 8081:80 --name my-web-app my-custom-web-image'
            }
        }
    }
}
