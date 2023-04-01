#!/bin/bash
if [ "$EUID" == 0 ]
  then echo "Please run as user then provide root password when prompted."
  exit
fi
echo Beginning pyenv install. If upgrading, remove the local '.pyenv' dir before running. && \
echo Checking dependencies. . . && \
sudo apt-get update || \
sudo apt-get install make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev || \
echo Installing pyenv. . . && \
curl https://pyenv.run | bash && \
echo Adding pyenv to path. . . && \
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc && \
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc && \
echo 'eval "$(pyenv init --path)"' >> ~/.bashrc && \
echo 'eval "$(pyenv init -)"' >> ~/.bashrc && \
echo Checking for pyenv updates. . . && \
pyenv update && \
echo Install located at: && \
which pyenv && \
echo Done.

