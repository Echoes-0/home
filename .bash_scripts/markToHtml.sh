#!/usr/bin/env bash

file=$1
pandoc -f markdown_github -t html $file > ${file%\.*}.html
