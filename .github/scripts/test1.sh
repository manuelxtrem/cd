#!/bin/bash
while read line; do
  if [[ $line =~ bird ]] ; then echo $line; fi
done <foo.text