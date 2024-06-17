# Use the official Python image from the Docker Hub
FROM mcr.microsoft.com/vscode/devcontainers/python:3.9-buster

# Install .NET SDK
RUN apt-get update && apt-get install -y wget python3-pip \
    && wget https://dot.net/v1/dotnet-install.sh \
    && chmod +x dotnet-install.sh \
    && ./dotnet-install.sh --channel 8.0 --version 8.0.100 \
    && rm dotnet-install.sh

# Install Jupyter Notebook
RUN pip install notebook
RUN pip install jupyterlab
RUN pip install numpy
# Install scikit-learn
RUN pip install scikit-learn


# [Optional] Uncomment this line to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

# [Optional] Uncomment this line to add additional extensions.
# RUN code-server --install-extension <extension-id>

# [Optional] Uncomment this line to add additional post-create commands.
# RUN <your-command-here>

# Set the default shell to bash instead of sh
ENV SHELL /bin/bash

# Set the working directory in the container
WORKDIR /workspace

# Copy the current folder content into the container at /workspace
COPY . /workspace/



# Make sure to replace <your-package-list-here> with any other specific system packages 
# you might need and <extension-id> with any additional VS Code extensions. 
# Also, adjust the --sdk-version in the .NET SDK installation command if you need a specific version.

# This setup will give you a development container with Python, Jupyter Notebook, and the .NET 8 SDK installed.