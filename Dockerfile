FROM jenkins/jenkins:lts
USER root
# install system deps: docker client, git, ssh-client, python3 & pip
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        unzip \
        git \
        openssh-client \
        python3 \
        python3-venv \
        bash \
    && python3 -m ensurepip \
    && python3 -m pip install --no-cache-dir --upgrade pip setuptools wheel \
    && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -rf awscliv2.zip aws \
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




