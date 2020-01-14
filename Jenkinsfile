pipeline {

    agent any
    stages {

        stage('Checkout'){
            steps {
                git(url: 'https://github.com/jscaro/weatherdashboard.git', branch: 'master')
                stash name:'Source', includes:'**/**'
                stash name:'Docker', includes:'**/Dockerfile'
            }
        } //Checkout

        stage('Build') {
            steps {
                unstash 'Source'
                synopsys_detect detectProperties: '--detect.source.path=. , --detect.project.name=weatherdashboard', returnStatus: true
            }
        }  // stage Build
    } //stages
  } //pipeline
