pipeline {
    agent any  // Esto indica que el pipeline puede ejecutarse en cualquier agente disponible

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/bryan6h9/docker-bench-circleci.git'
            }
        }
        
        stage('Build') {
            steps {
                // Aquí agregarías los pasos para construir tu proyecto
                echo 'Building project...'
                sh './build.sh'  // Ejemplo de un script para construir el proyecto
            }
        }

        stage('Run Tests') {
            steps {
                // Aquí agregarías los pasos para ejecutar tus pruebas
                echo 'Running tests...'
                sh './run_tests.sh'  // Ejemplo de un script para ejecutar pruebas
            }
        }

        stage('Generate Metrics') {
            steps {
                // Aquí puedes agregar el script o comandos que generen las métricas
                echo 'Generating metrics...'
                sh './generate_metrics.sh'  // Este es un ejemplo de cómo podrías generar métricas
            }
        }

        stage('Archive Metrics') {
            steps {
                // Aquí puedes archivar las métricas generadas para que estén disponibles después de la ejecución
                echo 'Archiving metrics...'
                archiveArtifacts artifacts: '**/metrics/*.json', allowEmptyArchive: true  // Ejemplo de archivos de métricas
            }
        }
    }
    
    post {
        always {
            // Aquí puedes agregar acciones a ejecutar después de que se complete el pipeline, como enviar notificaciones
            echo 'Pipeline completed!'
        }
    }
}
