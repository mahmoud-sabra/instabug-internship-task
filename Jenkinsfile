pipeline {
  agent any

  stages {
    // Build Docker image
    // Log in to DockerHub
    // Push the Docker image to DockerHub

    stage('Build') {
      agent {
             label 'build'
              }
      steps {
        // Build the Docker image
        script {
          def imageName = 'instabug-app'
          def imageTag = "${env.BUILD_NUMBER}"

          // Build the Docker image
          sh "docker build -t ${imageName}:${imageTag} ."
        }
      }
    }

    stage('Login to DockerHub') {
      steps {
        // Log in to DockerHub
        withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
          sh "docker login -u ${DOCKERHUB_USERNAME} -p ${DOCKERHUB_PASSWORD}"
        }
      }
    }

    stage('Push') { 
      steps {
        // Push the Docker image to DockerHub
        script {
          def imageName = 'instabug-app'
          def imageTag = "${env.BUILD_NUMBER}"
          def registryAddress = 'docker.io'  // DockerHub registry address
          def registryImagePath = "${registryAddress}/${DOCKERHUB_USERNAME}/${imageName}:${imageTag}"

          // Tag the image with the DockerHub registry address
          sh "docker tag ${imageName}:${imageTag} ${registryImagePath}"

          // Push the image to DockerHub
          sh "docker push ${registryImagePath}"
        }
      }
    }
  }
}

