FROM jenkins/jenkins:lts
USER root
# install system deps: docker client, git, ssh-client, python3 & pip
RUN apk add --no-cache curl unzip git openssh-client python3 py3-pip bash \
    && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -rf awscliv2.zip aws \
    && python3 -m ensurepip \
    && pip3 install --no-cache-dir --upgrade pip \
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


