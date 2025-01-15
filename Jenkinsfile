def secret = 'global'
def server = 'mentor@103.150.196.101'
def directory = 'dumbflix-backend'
def branch = 'master'
def image = 'alvindra/dumbflix-be-b22:latest'

pipeline {
    agent any
    stages {
        stage ('pulling new code'){
            steps{
                sshagent([secret]){
                    sh """ssh -o StrictHostKeyChecking=no ${server} << EOF 
                    cd ${directory}
                    git pull origin ${branch}
                    exit
                    EOF"""
                }
            }
        }
        stage ('Build Process'){
            steps{
                sshagent([secret]){
                    sh """ssh -o StrictHostKeyChecking=no ${server} << EOF 
                    cd ${directory}
                    docker build --no-cache -t ${image} .
                    exit
                    EOF"""
                }
            }
        }
        stage ('Deploy'){
            steps{
                sshagent([secret]){
                    sh """ssh -o StrictHostKeyChecking=no ${server} << EOF 
                    cd ${directory}
                    docker compose up -d
                    exit
                    EOF"""
                }
            }
        }
    }
}
