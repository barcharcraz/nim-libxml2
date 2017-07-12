#!/bin/sh
sed -r "/^#.*${1%.*}.*$/,/#/d" $1 | diff $1 - | grep -P '<\K' | sed -r 's/<//' | sed -r '/\s+#/d'
