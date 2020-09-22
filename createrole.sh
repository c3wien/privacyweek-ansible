#!/bin/bash

role="$1"

dirs="defaults files handlers tasks"

if [ -z "$role" ]; then
    echo "role name must be specified"
    exit 1
fi
if [ -e "roles/$role/" ]; then
    echo "role already exists."
    exit 1
fi

for subdir in $dirs; do
    mkdir -p "roles/$role/$subdir/"
done

echo "---" > roles/$role/tasks/main.yml
echo >> roles/$role/tasks/main.yml
echo "done, now edit roles/$role/tasks/main.yml"
