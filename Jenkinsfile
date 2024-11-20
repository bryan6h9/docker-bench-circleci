pipeline {
    agent any

    environment {
        GITHUB_CREDENTIALS = credentials('b8307d31-69b3-4bb9-a592-2ecadfd0285b')  // Define las credenciales como variable de entorno
    }

    stages {
        stage('Clone Repository') {
            steps {
                cleanWs() // Limpia el espacio de trabajo
                git credentialsId: "${GITHUB_CREDENTIALS}", url: 'https://github.com/bryan6h9/docker-bench-circleci.git', branch: 'main'
            }
        }

        stage('Build') {
            steps {
                echo 'Building the project...'
                // Simula una construcción o acción en el proyecto
            }
        }

        stage('Generate Metrics') {
            steps {
                script {
                    // Genera un archivo JSON con métricas simuladas
                    def metrics = [
                        timestamp: new Date().toString(),
                        repository: 'docker-bench-circleci',
                        branch: 'main',
                        buildStatus: 'success',
                        testCoverage: '85%',
                        buildDuration: '120s'
                    ]
                    
                    writeJSON file: 'metrics.json', json: metrics
                }
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                // Aquí puedes integrar pruebas reales
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying the application...'
                // Pasos de despliegue si aplica
            }
        }
    }

    post {
        always {
            echo 'Pipeline completed. Archiving results...'
            archiveArtifacts artifacts: 'metrics.json', fingerprint: true
        }
        success {
            echo 'Pipeline completed successfully.'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
