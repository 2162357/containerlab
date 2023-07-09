#!/bin/bash

CFG_DIR=./configs
CFG_CLAB=clab-cenario01

configure_CLIENT() {
  docker cp $CFG_DIR/$1.sh $CFG_CLAB-$1:/tmp/
  docker exec $CFG_CLAB-$1 bash /tmp/$1.sh 2>/dev/null
}

echo
PIDS=""
CLIENT=("client1" "client2")


for VARIANT in ${CLIENT[@]}; do
  ( configure_CLIENT $VARIANT ) &
  REF=$!
  echo "[$REF] Configuring $VARIANT..."
  PIDS+=" $REF"
done

echo
for p in $PIDS; do
  if wait $p; then
    echo "Process $p success"
  else
    echo "Process $p fail"
  fi
done
echo