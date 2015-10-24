FROM ubuntu:14.04
MAINTAINER Nick Tardif <nicktardif@gmail.com>
RUN apt-get update && apt-get upgrade -y

# Set bash to run by default
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

ENV HOME /root
WORKDIR /root

# Programs I like :)
RUN apt-get install -y \
  wget \
  tmux \
  vim \
  git \
  feh \
  vlc

RUN mkdir .ssh/
ADD ssh/ .ssh/
RUN chmod 600 .ssh/* && \
    ssh-keyscan github.com >> .ssh/known_hosts

RUN git clone git@github.com:nicktardif/dotfiles.git && \
    cd dotfiles && \
    ./install.sh --no-cache

CMD ["/bin/bash"]
