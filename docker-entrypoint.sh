#!/bin/bash

set -o nounset  # exit on unitialized vars
set -o errexit  # exit on [ $? != 0]
set -o pipefail # exit on pipeline errors

if [ -f "Gemfile" ]; then
   bundle install --retry 5 --jobs 20
   bundle clean --force
fi

"$@"
