FROM cs50/cli:minimal
ARG DEBIAN_FRONTEND=noninteractive


# Unset user
USER root


# Install Ubuntu packages
RUN apt update && \
    apt install --yes \
        jq


# Copy files to image
COPY ./etc /etc
COPY ./opt /opt
RUN chmod a+rx /opt/cs50/bin/*


# Temporary workaround for https://github.com/cs50/code.cs50.io/issues/19
RUN echo "if [ -z \"\$_CODESPACE_SH\" ] ; then . /etc/profile.d/codespace.sh; export _CODESPACE_SH=1; fi" >> /etc/bash.bashrc


# Set user
USER ubuntu
