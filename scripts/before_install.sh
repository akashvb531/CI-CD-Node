#!/bin/bash
echo "Before install - checking kubectl access"
kubectl get nodes
if [ $? -ne 0 ]; then
  echo "kubectl access failed"
  exit 1
fi
echo "kubectl access verified"
