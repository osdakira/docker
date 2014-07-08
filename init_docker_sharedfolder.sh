#!/bin/bash
VM_NAME=boot2docker-vm-vboxfs
WORKSPACE=`pwd`

VBoxManage sharedfolder \
    add "$VM_NAME" \
    --name $( basename $WORKSPACE ) \
    --hostpath $WORKSPACE \
    --transient

boot2docker --vm=$VM_NAME ssh \
    "sudo modprobe vboxsf && sudo mkdir -p $WORKSPACE && sudo mount -t vboxsf $( basename $WORKSPACE ) $WORKSPACE"
