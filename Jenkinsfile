pipeline{
    agent any
    tools{
        maven 'maven'
    }
    stages{
        stage('clone'){
            steps{
                git 'https://github.com/narendrakumar998931/test.git'
            }
        }
        stage('pack'){
            steps{
                sh 'mvn package'
            }
        }
        stage('copy'){
            steps{
                sshagent(['node2']) {
                    sh 'scp -o StrictHostKeyChecking=no target/ansidoc.war ec2-user@10.1.2.107:/home/ec2-user/target/'
                    sh 'scp -o StrictHostKeyChecking=no Dockerfile ec2-user@10.1.2.107:/home/ec2-user/'
                }
            }
        }
        stage('playbook'){
            steps{
                ansiblePlaybook credentialsId: 'node2', disableHostKeyChecking: true, installation: 'ansible', inventory: 'hosts', playbook: 'excute.yml'
            }
        }
        stage('image create'){
            steps{
                sshagent(['node2']) {
                    sh 'ssh -o StrictHostKeyChecking=no ec2-user@10.1.2.107 docker run -tid --name=ansiweb -p 8000:8080 bnani/ansi'
                }
            }
        }
    }
}
