pipeline {
    agent any

    environment {
        BACKEND_REPO = 'https://github.com/Manef-Ben-Mansour1/service-com-backend.git'
        FRONTEND_REPO = 'https://github.com/emna-dammak/service-com-Frontend.git'
        BACKEND_BRANCH = 'feature/docker'
        FRONTEND_BRANCH = 'feature/docker'
        DOCKER_CREDENTIALS_ID = 'docker-hub-credentials'
        BACKEND_IMAGE = 'medazizbendhiab/service_com'
        FRONTEND_IMAGE = 'medazizbendhiab/service_com_reactjs'
        DOCKER_TAG = '1.0'
        SSH_CREDENTIALS_ID ='ssh_key'
    }

    stages {
        stage('Checkout Backend') {
            steps {
                dir('backend') {
                    git url: "${env.BACKEND_REPO}", branch: "${env.BACKEND_BRANCH}", credentialsId: 'github-creds'
                }
            }
        }

        stage('Checkout Frontend') {
            steps {
                dir('frontend') {
                    git url: "${env.FRONTEND_REPO}", branch: "${env.FRONTEND_BRANCH}", credentialsId: 'github-creds'
                }
            }
        }

        stage('Build Backend Image') {
            steps {
                script {
                    dir('backend') {
                        sh " docker build -t ${env.BACKEND_IMAGE}:${env.DOCKER_TAG} ."
                    }
                }
            }
        }

        stage('Build Frontend Image') {
            steps {
                script {
                    dir('frontend') {
                        sh "docker build -t ${env.FRONTEND_IMAGE}:${env.DOCKER_TAG} ."
                    }
                }
            }
        }

        stage('Push Backend Docker Image') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: env.DOCKER_CREDENTIALS_ID, passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                        sh "echo $PASS | docker login -u $USER --password-stdin"
                        sh " docker push ${env.BACKEND_IMAGE}:${env.DOCKER_TAG}"
                    }
                }
            }
        }

        stage('Push Frontend Docker Image') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: env.DOCKER_CREDENTIALS_ID, passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                        sh "echo $PASS | docker login -u $USER --password-stdin"
                        sh "docker push ${env.FRONTEND_IMAGE}:${env.DOCKER_TAG}"
                    }
                }
            }

        }

            stage('provision server') {

            steps {
                script {
                    dir('terraform') {
                        sh "terraform init"
                        sh "terraform apply --auto-approve"
                        sh "terraform refresh"

                        env.VM_PUBLIC_IP = sh(
                            script: "terraform output public_ip",
                            returnStdout: true
                        ).trim()
                    }
                }
            }
        }

         stage('Install Docker and Docker Compose on Azure VM') {
            steps {
                script {
                    def vmInstance = "servicecom@${env.VM_PUBLIC_IP}"
                    def installDockerCommands = """
                        sudo apt-get update
                        sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
                        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
                        sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu \$(lsb_release -cs) stable"
                        sudo apt-get update
                        sudo apt-get install -y docker-ce
                        sudo usermod -aG docker \$USER
                        sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-\$(uname -s)-\$(uname -m)" -o /usr/local/bin/docker-compose
                        sudo chmod +x /usr/local/bin/docker-compose
                    """

                    withCredentials([sshUserPrivateKey(credentialsId: env.SSH_CREDENTIALS_ID, keyFileVariable: 'SSH_KEY')]) {
                        sh "ssh -i $SSH_KEY -o StrictHostKeyChecking=no ${vmInstance} '${installDockerCommands}'"
                    }
                    sh "docker -v "
                    sh "docker-compose -v "

                }
            }
         }

    }
}