pipeline {

    agent any
    stages {

        stage('Checkout'){
            steps {
                git(url: 'https://github.com/jscaro/weatherdashboard.git', branch: 'master')
                stash name:'Source', includes:'**/**'
            }
        } //Checkout

        stage('Build') {
            agent {
                docker {
                    image 'python:3.7-slim-buster'
                    args ' -v $HOME/.m2:/root/.m2'
                }
            } //agent

            steps {
                unstash 'Source'
                sh 'pip3 install Flask Flask-wtf waitress'
                sh 'echo here'
            }
        }  // stage Build
    } //stages
  } //pipeline
