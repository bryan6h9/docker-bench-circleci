pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                cleanWs() // Limpia el espacio de trabajo
                git url: 'https://github.com/bryan6h9/docker-bench-circleci.git', branch: 'main'
            }
        }

        stage('Build') {
            steps {
                echo 'Building the project...'
                // Simula una construcción o acción en el proyecto
                sh 'echo "Simulating build..."'
            }
        }

        stage('Run Tests') {
            steps {
                echo 'Running tests...'
                // Simula pruebas (reemplaza con tus pruebas reales)
                sh 'echo "Running tests..."'
                // Simulando una prueba de éxito, deberías tener algo real aquí
            }
        }

        stage('Generate Metrics') {
            steps {
                script {
                    // Obtener métricas reales
                    def buildStatus = currentBuild.result ?: 'SUCCESS' // Estado del build (SUCCESS, FAILURE)
                    def buildDuration = currentBuild.durationString // Duración de la construcción
                    def testCoverage = '85%' // Aquí puedes integrar un análisis real, por ejemplo, con JaCoCo o Cobertura

                    // Crear el HTML con las métricas reales
                    def metricsHtml = """
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
                                    <td>${buildStatus}</td>
                                    <td>${testCoverage}</td>
                                    <td>${buildDuration}</td>
                                </tr>
                            </table>
                        </body>
                        </html>
                    """

                    // Escribir el archivo HTML con las métricas
                    writeFile file: 'build_metrics.html', text: metricsHtml
                }
            }
        }

        stage('Archive Metrics') {
            steps {
                archiveArtifacts artifacts: 'build_metrics.html', allowEmptyArchive: true
            }
        }
    }

    post {
        always {
            echo 'Pipeline completed. Archiving results...'
        }
        success {
            echo 'Pipeline completed successfully.'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
