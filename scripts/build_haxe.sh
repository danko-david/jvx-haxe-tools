#!/bin/bash

set -e
cd "$(dirname "$0")"
cd ../WD/

#cleanup and build library for PHP
mkdir -p ../WD/pot_builder_php
rm -Rf ./pot_builder_php/{cache,lib}
mkdir ./pot_builder_php/cache
chmod 777 ./pot_builder_php/cache
haxe -cp ../source/haxe/ $(find ../source/haxe/ -name *.hx | sed -e "s/..\/source\/haxe\/\(.*\)\.hx/\1/g" | sed -e "s/\//./g") -php pot_builder_php

#cleanup and build library for Java
mkdir -p ../WD/pot_builder_java
haxe -cp ../source/haxe/ $(find ../source/haxe/ -name *.hx | sed -e "s/..\/source\/haxe\/\(.*\)\.hx/\1/g" | sed -e "s/\//./g") -java pot_builder_java


