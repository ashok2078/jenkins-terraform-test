pipeline {
    agent any

    stages {
        stage('Build & Test') {
            steps {
                echo "Checking Terraform and Running Test Script..."
                sh 'terraform --version'
                sh 'chmod +x test.sh'
                sh './test.sh'
            }
        }

        stage('Docker Cleanup') {
            steps {
                echo "Cleaning up old containers and images..."
                // Purana container stop karke delete karega
                sh 'docker rm -f my-web-app || true'
                // Purani images ko bhi delete karega taaki space bache
                sh 'docker rmi my-custom-web-image || true'
            }
        }

        stage('Docker Build & Deploy') {
            steps {
                echo "Building fresh image and starting website..."
                // --no-cache se Docker hamesha nayi index.html read karega
                sh 'docker build --no-cache -t my-custom-web-image .'
                
                // Port 8081 par aapki website chalu ho jayegi
                sh 'docker run -d -p 8081:80 --name my-web-app --restart always my-custom-web-image'
                
                echo "Success! Your webpage is now updated on port 8082."
            }
        }
    }
}
