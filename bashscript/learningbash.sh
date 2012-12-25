#!/bin/bash
##
## this script will contain all the simple script for learning purpose
##

function mygrep()
{
grep $1 << EOF
text1 haha \$100
text2 hehe $200
EOF
}

mygrep "$@"

