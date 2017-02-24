#!/bin/bash

render_template() {
  eval "echo \"$(cat $1)\""
}

for t in /conf/*.tmpl; do
  out=${t%.tmpl}
  echo "Rendering $t into $out"
  render_template $t > $out
done

export FOREGROUND=true

if [[ $# -gt 0 ]]; then
  cmd=$1
  shift
  bin/${cmd}.sh $*
else
  bin/grakn-engine.sh start
fi
