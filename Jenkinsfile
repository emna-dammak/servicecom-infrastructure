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

                        EC2_PUBLIC_IP = sh(
                            script: "terraform output public_ip",
                            returnStdout: true
                        ).trim()
                    }
                }
            }
        }

    }
}