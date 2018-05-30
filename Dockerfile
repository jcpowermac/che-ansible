FROM quay.io/jcallen/che-fedora-base


EXPOSE 8080 8000 9191
ENV REQUIRED_PKGS="python-virtualenv libffi-devel openssl-devel libyaml-devel gmp-devel libselinux-python make gcc redhat-rpm-config libxml2-python libxslt-python ansible"

ENV OPTIONAL_PKGS="pv python-psycopg2 zsh vim vim-jedi vim-powerline vim-pysmell vim-syntastic vim-syntastic-python"
ENV PIP_PKGS="linchpin"

USER root

RUN dnf install -y ${REQUIRED_PKGS} ${OPTIONAL_PKGS} && \
    dnf clean all

# Optional - download and install oh-my-zsh
ADD https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh /home/user/

RUN chown user:users /home/user/install.sh && \
    chmod 755 /home/user/install.sh

USER user

RUN pip install --user ${PIP_PKGS} && \
    /home/user/install.sh >/dev/null 2>&1 && \
    ln -s /usr/share/vim/vimfiles/ /home/user/.vim
COPY .vimrc /home/user

