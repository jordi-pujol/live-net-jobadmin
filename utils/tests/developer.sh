#!/bin/bash

basename -s '.module' $(ls -1 lib/*.module) | \
	while read f; do
		awk -v f=$f '$1 == f {rc=-1; exit} END{exit rc+1}' conf/cmds.conf || \
		echo "There is not a cmd for module" $f
	done

awk '$1 ~ "^[^#]" {print $1}' conf/cmds.conf | \
	while read f; do
		ls -1 lib/$f.module > /dev/null 2>&1 || \
		echo "There is not a module for cmd" $f
	done

