#!/bin/bash

set -x

VM_NAME=boot2docker-vm-vboxfs
WORKSPACE=`pwd`

if [ $(boot2docker --vm=boot2docker-vm-vboxfs status) != "running" ]; then
    boot2docker --vm=boot2docker-vm-vboxfs up
fi

VBoxManage sharedfolder \
    add "$VM_NAME" \
    --name $( basename $WORKSPACE ) \
    --hostpath $WORKSPACE \
    --transient

boot2docker --vm=$VM_NAME ssh \
    "sudo modprobe vboxsf && sudo mkdir -p $WORKSPACE && sudo mount -t vboxsf $( basename $WORKSPACE ) $WORKSPACE"

set +x
