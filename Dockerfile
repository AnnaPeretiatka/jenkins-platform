FROM jenkins/jenkins:lts
USER root
# install system deps: docker client, git, ssh-client, python3 & pip
RUN apt-get update \
&& apt-get install -y --no-install-recommends git openssh-client python3 python3-pip unzip awscli\
# && usermod -aG docker jenkins \
&& rm -rf /var/lib/apt/lists/*

# Install plugins for Jenkins (automatically)
RUN jenkins-plugin-cli --plugins \
workflow-aggregator \
docker-workflow \
docker-plugin \
git \
git-client \
github \
github-branch-source \
credentials \
credentials-binding \
ssh-credentials \
ssh-agent \
amazon-ecr \
pipeline-utility-steps \
pipeline-stage-view \
plain-credentials

USER jenkins

