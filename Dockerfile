# platform/Dockerfile
FROM jenkins/jenkins:lts


USER root


# install system deps: docker client, git, ssh-client, python3 & pip
RUN apt-get update \
&& apt-get install -y --no-install-recommends docker.io git ssh-client python3 python3-pip unzip \
&& pip3 install --upgrade awscli \
&& usermod -aG docker jenkins \
&& rm -rf /var/lib/apt/lists/*


# Install commonly-needed plugins (adjust versions if you prefer)
# The list includes: pipeline, docker pipeline, docker cloud, git, github multibranch, ssh-agent, credentials, amazon-ecr
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
