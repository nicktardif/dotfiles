FROM ubuntu:14.04
MAINTAINER Nick Tardif <nicktardif@gmail.com>
RUN apt-get update && apt-get upgrade -y

# Set bash to run by default
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Programs I like :)
RUN apt-get install -y \
  wget \
  tmux \
  vim \
  git \
  feh \
  vlc

RUN apt-get update && apt-get install -y \
  toilet
  python-pip

RUN export uid=1000 gid=1000 && \
    mkdir -p /home/nick && \
    echo "nick:x:${uid}:${gid}:Nick,,,:/home/nick:/bin/bash" >> /etc/passwd && \
    echo "nick:x:${uid}:" >> /etc/group && \
    echo "nick ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/nick && \
    chmod 0440 /etc/sudoers.d/nick && \
    chown ${uid}:${gid} -R /home/nick

USER nick
ENV HOME /home/nick
WORKDIR /home/nick

RUN mkdir .ssh/ Git/
ADD ssh/ .ssh/
RUN sudo chown nick:nick .ssh/* && \
    chmod 600 .ssh/* && \
    ssh-keyscan github.com >> .ssh/known_hosts

# Cache buster
ADD version version
RUN rm version

WORKDIR /home/nick/Git
RUN git clone git@github.com:nicktardif/dotfiles.git && \
    cd dotfiles && \
    ./install.sh

RUN pip install git+git://github.com/Lokaltog/powerline && \
    wget https://github.com/powerline/fonts/blob/master/Inconsolata/Inconsolata%20for%20Powerline.otf /usr/share/fonts & \
    fc-cache -vf

WORKDIR /home/nick
CMD ["/bin/bash"]
