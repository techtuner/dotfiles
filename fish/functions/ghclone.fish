#!/usr/bin/fish

function ghclone
  if set -q "$argv"
    echo "Usage: ghclone <username> <repository>"
    return 1
  end
  set username $argv[1]
  set repository $argv[2]

gh repo clone $username/$repository && cd $repository
end
