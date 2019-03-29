#!/bin/bash

if [ -z "$1" ]; then
  echo Please give a name to the new module
else
  echo Creating module $1
  mkdir $1

  echo Creating manifests folder
  mkdir $1/manifests

  echo Creating files folder
  mkdir $1/files

  echo Creating templates folder
  mkdir $1/templates

  echo Creating init.pp file
  touch $1/manifests/init.pp
  chown :group06 /etc/puppet/modules/$1/manifests/init.pp
  chmod 674 /etc/puppet/modules/$1/manifests/init.pp

  echo Creating install.pp file
  touch $1/manifests/install.pp 
  chown :group06 /etc/puppet/modules/$1/manifests/install.pp 
  chmod 674 /etc/puppet/modules/$1/manifests/install.pp 

  echo Creating config.pp file
  touch $1/manifests/config.pp
  chown :group06 /etc/puppet/modules/$1/manifests/config.pp 
  chmod 674 /etc/puppet/modules/$1/manifests/config.pp

  echo Creating service.pp file
  touch $1/manifests/service.pp
  chown :group06 /etc/puppet/modules/$1/manifests/service.pp 
  chmod 674 /etc/puppet/modules/$1/manifests/service.pp
fi
