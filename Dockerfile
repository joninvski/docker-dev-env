FROM gliderlabs/alpine:latest
RUN apk --update add zsh vim git openssh-client build-base bash

ENV HOME /home

RUN git clone --depth 1 https://github.com/joninvski/zsh.git /home/config/zsh
RUN git clone --depth 1 https://github.com/joninvski/vim.git /home/config/vim
RUN cd /home/config/zsh && make
RUN cd /home/config/vim && make

WORKDIR /home

ENTRYPOINT ["zsh"]
