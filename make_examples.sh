#!/bin/bash

for n3 in list/*.n3 ; do
    eye --nope --quiet --pass-only-new $n3 > $n3.out 2> /dev/null
done
