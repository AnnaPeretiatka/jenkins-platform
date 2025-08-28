FROM jenkins/jenkins:lts
#RUN jenkins-plugin-cli --plugins "blueocean docker:1.2.0"
USER root
# Install docker CLI inside Jenkins container
RUN apt-get update && apt-get install -y docker.io python3-pip && usermod -aG docker jenkins
USER jenkins
