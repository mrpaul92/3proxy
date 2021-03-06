#!/bin/bash

#######################################
# 3proxy Semi Automatic Installer     #
# with Authentication + Sample Config #
# Version: 1.1                        #
# Branch: Development                 #
#######################################
# Author: Hidden Refuge               #
# License: MIT (DO WHAT YOU WANT)     #
# Copyright (c) 2017 - Hidden Refuge  #
#######################################

# Creating temporary working directory
mkdir /tmp/proxy
cd /tmp/proxy

# Downloading latest stable 3proxy 0.8.9
wget --no-check-certificate https://www.3proxy.ru/current/3proxy-0.9-devel.tgz

# Extracting archive
tar -xvzf 3proxy-0.9-devel.tgz

# Compiling
cd 3proxy/
make -f Makefile.Linux

# Moving executable file to current user home directory
cd src/
mv 3proxy $HOME

# Downloading sample configuration to current user home directory
cd $HOME
wget --no-check-certificate https://raw.githubusercontent.com/hidden-refuge/3proxy/master/3proxy.cfg

# Fixing permission on files
chmod +x 3proxy

# Removing temporary working directory from tmp
rm -rf /tmp/proxy

# Creating folder for logs or otherwise 3proxy won't work
mkdir /var/log/3proxy
