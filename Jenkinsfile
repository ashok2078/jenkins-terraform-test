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
                // Purana container clean karna
                sh 'docker rm -f my-web-app || true'
                
                // Nayi image banana (index.html copy ho jayega)
                sh 'docker build -t my-custom-web-image .'
                
                // --restart always se VM chalu hote hi website live ho jayegi
                sh 'docker run -d -p 8081:80 --name my-web-app --restart always my-custom-web-image'
            }
        }
    }
}
