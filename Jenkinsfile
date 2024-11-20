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
                    // Crea un archivo HTML con métricas simuladas
                    def metricsHtml = '''
                        <html>
                        <head>
                            <title>Build Metrics</title>
                        </head>
                        <body style="background-color:#0a1929; color: #fff;">
                            <h1 style="text-align:center; color: #00ffff;">Build Metrics</h1>
                            <table border="1" style="width:100%; margin: 20px;">
                                <tr>
                                    <th>Timestamp</th>
                                    <th>Repository</th>
                                    <th>Branch</th>
                                    <th>Build Status</th>
                                    <th>Test Coverage</th>
                                    <th>Build Duration</th>
                                </tr>
                                <tr>
                                    <td>${new Date().toString()}</td>
                                    <td>docker-bench-circleci</td>
                                    <td>main</td>
                                    <td>success</td>
                                    <td>85%</td>
                                    <td>120s</td>
                                </tr>
                            </table>
                        </body>
                        </html>
                    '''
                    // Escribir el archivo HTML en el espacio de trabajo
                    writeFile file: 'build_metrics.html', text: metricsHtml
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
            // Archivar el archivo HTML generado como artefacto
            archiveArtifacts artifacts: 'build_metrics.html', allowEmptyArchive: true
        }
        success {
            echo 'Pipeline completed successfully.'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
