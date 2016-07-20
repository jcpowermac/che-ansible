FROM codenvy/alpine_jdk8

MAINTAINER Joseph Callen <jcpowermac@gmail.com>


RUN sudo apk --update add python py-pip openssl ca-certificates    && \
    sudo apk --update add --virtual build-dependencies \
                python-dev libffi-dev openssl-dev build-base  && \
    sudo pip install --upgrade pip cffi                            && \
    sudo pip install ansible                && \
    sudo apk --update add sshpass openssh-client  && \
    sudo apk del build-dependencies            && \
    sudo rm -rf /var/cache/apk/*               && \
    sudo mkdir -p /etc/ansible                        && \
    sudo pip install --upgrade pyyaml jinja2 pycrypto paramiko httplib2 boto xmltodict pywinrm pyvmomi
