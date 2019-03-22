#!/bin/bash

set -e
cd "$(dirname "$0")"
cd ../WD/

#cleanup and build library for PHP
mkdir -p ../WD/output_php
rm -Rf ./output_php/{cache,lib}
mkdir ./output_php/cache
chmod 777 ./output_php/cache
haxe -cp ../source/haxe/ $(find ../source/haxe/ -name *.hx | sed -e "s/..\/source\/haxe\/\(.*\)\.hx/\1/g" | sed -e "s/\//./g") -php output_php

#cleanup and build library for Java
rm -R ../WD/output_java
mkdir -p ../WD/output_java
haxe -cp ../source/haxe/ $(find ../source/haxe/ -name *.hx | sed -e "s/..\/source\/haxe\/\(.*\)\.hx/\1/g" | sed -e "s/\//./g") -java output_java

#cleanup and build library for JS
#rm -R ../WD/output_js
#mkdir -p ../WD/output_js
#haxe -cp ../source/haxe/ $(find ../source/haxe/ -name *.hx | sed -e "s/..\/source\/haxe\/\(.*\)\.hx/\1/g" | sed -e "s/\//./g") -js output_js

#cleanup and build library for C++
#rm -R ../WD/output_cpp
#mkdir -p ../WD/output_cpp
#haxe -cp ../source/haxe/ $(find ../source/haxe/ -name *.hx | sed -e "s/..\/source\/haxe\/\(.*\)\.hx/\1/g" | sed -e "s/\//./g") -cpp output_cpp


