if ! VBoxManage -v >/dev/null 2>&1 ;then
    curl -L -O http://download.virtualbox.org/virtualbox/4.3.12/VirtualBox-4.3.12-93733-OSX.dmg
    open VirtualBox-4.3.12-93733-OSX.dmg
    echo "re-run $0"
    exit
fi

if ! brew list docker >/dev/null 2>&1; then
    brew install docker boot2docker
fi

boot2docker init
boot2docker up

if [ -f ~/.bashrc ]; then
    echo "export DOCKER_HOST=tcp://192.168.59.103:2375" >> ~/.bashrc
    export DOCKER_HOST=tcp://192.168.59.103:2375
fi

if [ -f ~/.zshrc ]; then
    echo "export DOCKER_HOST=tcp://192.168.59.103:2375" >> ~/.zshrc
    export DOCKER_HOST=tcp://192.168.59.103:2375
fi
