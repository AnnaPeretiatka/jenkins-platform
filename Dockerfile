FROM jenkins/jenkins:lts

# Switch to root to install dependencies
USER root

# Install docker CLI and AWS CLI inside the Jenkins container
RUN apt-get update && \
    apt-get install -y docker.io python3-pip unzip && \
    curl "https://d1vvhvl2y92vvt.cloudfront.net/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    sudo ./aws/install && \
    rm -rf awscliv2.zip ./aws && \
    usermod -aG docker jenkins

# Switch back to jenkins user
USER jenkins
