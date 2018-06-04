#!/bin/bash

export OPENTRACING_VERSION=1.4.2
NGINX_VERSIONS=(1.14.0 1.13.12)

# Compile for a portable cpu architecture
export CFLAGS="-march=x86-64 -fPIC"
export CXXFLAGS="-march=x86-64 -fPIC"
export LDFLAGS="-fPIC"

./ci/build_static_opentracing.sh

for NGINX_VERSION in ${NGINX_VERSIONS[*]}
do
  ./ci/build_module_binary.sh $NGINX_VERSION
done
