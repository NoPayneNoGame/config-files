function net
  if count $argv > /dev/null
    echo Stopping netctl...
    sudo netctl stop-all
    echo Connecting to wlp3s0-$argv...
    sudo netctl start wlp3s0-$argv
    echo Connected.
  else
    netctl list | awk -F"-" '{ st = index($0, "-"); print substr($0, st+1) }'
  end
end