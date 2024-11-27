pipeline {
    agent any  // Esto indica que el pipeline puede ejecutarse en cualquier agente disponible

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/bryan6h9/docker-bench-circleci.git'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                echo 'Building Docker Image...'
                sh '''
                    docker build -t docker-bench-security-image .
                '''
            }
        }

        stage('Run Docker Bench Security') {
            steps {
                echo 'Running Docker Bench Security...'
                sh '''
                    docker run -it --network="host" --pid="host" --cap-add audit_control \
                        -v /var/lib:/var/lib -v /var/run:/var/run -v /etc:/etc \
                        -v /usr/bin:/usr/bin -v /usr/lib:/usr/lib \
                        docker-bench-security-image > docker_bench_report.html
                '''
            }
        }

        stage('Generate Metrics') {
            steps {
                echo 'Generating metrics...'
                sh './generate_metrics.sh'
            }
        }

        stage('Archive Metrics and Report') {
            steps {
                echo 'Archiving metrics and report...'
                archiveArtifacts artifacts: '**/metrics/*.json, docker_bench_report.html', allowEmptyArchive: true
            }
        }
    }
    
    post {
        always {
            echo 'Pipeline completed!'
        }
    }
}
