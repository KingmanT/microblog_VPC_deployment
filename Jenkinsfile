pipeline {
  agent any
    stages {
        stage ('Build') {
            steps {
                sh '''#!/bin/bash
                echo "This is a build stage"
                '''
            }
        }
        stage ('Test') {
            steps {
                sh '''#!/bin/bash
                echo "This is a test stage"
                #source venv/bin/activate
                #py.test ./tests/unit/ --verbose --junit-xml test-reports/results.xml
                '''
            }
        }
      stage ('Deploy') {
            steps {
                sh '''#!/bin/bash
                ssh ubuntu@52.55.132.82 'source /home/ubuntu/setup.sh'
                '''
            }
        }
    }
}
