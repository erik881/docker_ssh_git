FROM node:8.11-alpine

ARG SSH_PRIVATE_KEY

RUN echo $SSH_PRIVATE_KEY

# Prepare for SSH
RUN apk update
RUN apk add openssh

# Create ssh folder
RUN mkdir -p /root/.ssh

# Setup private key
RUN echo "${SSH_PRIVATE_KEY}" >> /root/.ssh/id_rsa && chmod 600 /root/.ssh/id_rsa

# Authorize SSH Host
RUN touch /root/.ssh/known_hosts
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts

# Install Git
RUN apk add git

# Clone git
RUN git clone git@github.com:erik881/rabbitmq-tutorial.git

RUN echo DONE