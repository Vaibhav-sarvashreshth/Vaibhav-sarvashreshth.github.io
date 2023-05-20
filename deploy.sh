#!/bin/bash
echo outer
: `
git status
git add .
git commit -m "Comment"
git push
`
