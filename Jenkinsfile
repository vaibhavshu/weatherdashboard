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

       /* stage('Build') {
            steps {
                unstash 'Source'
                synopsys_detect detectProperties: '--detect.source.path=. , --detect.project.name=weatherdashboard', returnStatus: true
            }
        }  // stage Build
        */
        
        
     stage('App Image Build') {
            steps {
                script {
                    unstash 'Docker'
                    unstash 'Source'
                    sh 'cp Dockerfile .'
                    
                    docker.build('weather:latest')
                    print 'App Image is built'
                   
                }
            }
        } // App Image Build
        
        
        stage('Deploy') {
            steps {
                script {
                    docker.image('weather:latest').run('-d --name weather -p 8181:8080')            
                    sleep 45
                    sh 'wget http://localhost:8181'
                }
            }
        }


        
        
        
        
        
    } //stages
  } //pipeline
