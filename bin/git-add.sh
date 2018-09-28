#!/bin/bash

# Stage all files marked as 'modified' but not staged
#git status --porcelain | grep '^[AM ][DM]' | cut -dM  -f2- | xargs git add
git status --porcelain | grep '^[AM ][DM]' | gawk '/D / {print $2}; /M / {print $2}' | xargs git add
