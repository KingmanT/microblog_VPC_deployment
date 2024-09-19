pipeline {
  agent any
    stages {
        stage ('Build') {
            steps {
                sh '''#!/bin/bash
                echo "This is a build stage
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
      stage ('Clean') {
            steps {
                sh '''#!/bin/bash
                if [[ $(ps aux | grep -i "gunicorn" | tr -s " " | head -n 1 | cut -d " " -f 2) != 0 ]]
                then
                ps aux | grep -i "gunicorn" | tr -s " " | head -n 1 | cut -d " " -f 2 > pid.txt
                kill $(cat pid.txt)
                exit 0
                fi
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
