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
        stage('Docker Deploy') {
            steps {
                // Purana container hatana (Restart ke baad cleanup zaroori hai)
                sh 'docker rm -f my-web-app || true'
                
                // Nayi image build karna (index.html ke saath)
                sh 'docker build -t my-custom-web-image .'
                
                // Container run karna
                sh 'docker run -d -p 8081:80 --name my-web-app --restart always my-custom-web-image'
            }
        }
    }
}
