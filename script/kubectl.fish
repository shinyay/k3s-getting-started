#!/usr/bin/env fish

function func_kubectl
  argparse -n func_kubectl 'h/help' 'c/command' -- $argv
  or return 1

  if set -lq _flag_help
    echo "kubectl.fish -f <KUBECTL_COMMAND>"
    return
  end

  set -lq _flag_command
  or set -l _flag_command get all

  kubectl --kubeconfig ../kubeconfig.yaml $_flag_command
end

func_kubectl $argv
