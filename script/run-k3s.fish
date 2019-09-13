#!/usr/bin/env fish

function run_k3s
  argparse -n run_k3s 'h/help' 'f/file' -- $argv
  or return 1

  if set -lq _flag_help
    echo "run_k3s.fish -f <DOCKER-COMPOSE-YAML>"
    return
  end

  set -lq _flag_file
  or set -l _flag_file ../docker-compose.yml

  docker-compose -f $_flag_file up -d --scale node=3
end

run_k3s $argv
