#!/bin/sh

if [[ -a $SSH_AUTH_SOCK ]]; then
    rm -f $SSH_AUTH_SOCK
fi

/usr/bin/ssh-agent -D -a $SSH_AUTH_SOCK
