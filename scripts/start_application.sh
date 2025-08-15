#!/bin/bash
echo "Starting application deployment"
kubectl apply -f deployment.yaml
kubectl rollout status deployment/brain-tasks-app --timeout=120s
if [ $? -ne 0 ]; then
  echo "Deployment rollout failed"
  exit 1
fi
echo "Deployment succeeded"
