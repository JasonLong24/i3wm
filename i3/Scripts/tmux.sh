#!/bin/sh
tmux kill-server
tmux att -t get ||
tmux \
	new \; \
	neww vim\; \
	neww alsamixer\; \
	neww nmon\; \
	selectw -t 0\; \
