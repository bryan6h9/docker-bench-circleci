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
                    // Genera métricas simuladas
                    def metrics = [
                        timestamp: new Date().toString(),
                        repository: 'docker-bench-circleci',
                        branch: 'main',
                        buildStatus: 'success',
                        testCoverage: 85,  // Convertido a número para generar gráfico
                        buildDuration: 120 // Convertido a segundos para gráfico
                    ]
                    
                    // Guarda las métricas en un archivo JSON
                    writeJSON file: 'metrics.json', json: metrics
                    
                    // Genera datos para los gráficos (debe ser un archivo CSV o similar)
                    def coverageData = """timestamp,coverage
${new Date().toString()},${metrics.testCoverage}
"""
                    writeFile file: 'coverage.csv', text: coverageData

                    def durationData = """timestamp,duration
${new Date().toString()},${metrics.buildDuration}
"""
                    writeFile file: 'duration.csv', text: durationData
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
            archiveArtifacts artifacts: 'metrics.json, coverage.csv, duration.csv', fingerprint: true
        }
        success {
            echo 'Pipeline completed successfully.'

            // Genera gráficos con los datos de los CSV
            plot(
                title: 'Test Coverage Over Time',
                style: 'line', 
                data: [
                    [file: 'coverage.csv', label: 'Coverage %', color: 'blue']
                ]
            )

            plot(
                title: 'Build Duration Over Time',
                style: 'line', 
                data: [
                    [file: 'duration.csv', label: 'Build Duration (s)', color: 'green']
                ]
            )
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
