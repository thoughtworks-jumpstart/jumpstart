#!/usr/bin/env zsh

set -e

grep -ohER 'github.com/thoughtworks-jumpstart/[-a-zA-Z0-9_]+' **/*.md | sort | uniq

