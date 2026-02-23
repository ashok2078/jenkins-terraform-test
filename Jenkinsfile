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
                stage('Docker Deploy') {
    steps {
        // Purana crash hone wala container remove karo agar hai toh
        sh 'docker rm -f infinite-crash || true'
        // Naya container chalao
        sh 'docker run -d --name infinite-crash --restart always alpine sh -c "sleep 5; exit 1"'
        // Check karo ki status kya hai
        sh 'docker ps'
            }
        }
    }
}
