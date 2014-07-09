set -x

if ! VBoxManage -v >/dev/null 2>&1 ; then
    curl -L -O http://download.virtualbox.org/virtualbox/4.3.12/VirtualBox-4.3.12-93733-OSX.dmg
    open VirtualBox-4.3.12-93733-OSX.dmg
    echo "re-run $0"
    exit
fi

if ! brew list docker >/dev/null 2>&1 ; then
    brew install docker
fi

if brew list boot2docker >/dev/null 2>&1 ; then
    brew install boot2docker
fi

if [ ! -f ~/.boot2docker/boot2docker-vboxfs.iso ]; then
    curl -L http://static.dockerfiles.io/boot2docker-v1.0.1-virtualbox-guest-additions-v4.3.12.iso > ~/.boot2docker/boot2docker-vboxfs.iso
fi

if ! boot2docker --vm=boot2docker-vm-vboxfs status >/dev/null 2>&1 ; then
    boot2docker --vm=boot2docker-vm-vboxfs --iso=${HOME}/.boot2docker/boot2docker-vboxfs.iso init
fi

if [ $(boot2docker --vm=boot2docker-vm-vboxfs status) != "running" ]; then
    boot2docker --vm=boot2docker-vm-vboxfs up
fi

if [ -z ${DOCKER_HOST} ]; then
    [[ -f ~/.bashrc ]] && SHELL_RC=~/.bashrc
    [[ -f ~/.zshrc ]] && SHELL_RC=~/.zshrc
    if [ -n ${SHELL_RC} ]; then
        echo "alias boot2docker='boot2docker --vm=boot2docker-vm-vboxfs'" >> ${SHELL_RC}
        echo "export DOCKER_HOST=tcp://$(boot2docker --vm=boot2docker-vm-vboxfs ip 2>/dev/null):2375" >> ${SHELL_RC}
    fi
fi

alias boot2docker='boot2docker --vm=boot2docker-vm-vboxfs'
export DOCKER_HOST=tcp://$(boot2docker --vm=boot2docker-vm-vboxfs ip 2>/dev/null):2375

set +x

# ## setup ubuntu
# # docker pull ubuntu:latest
