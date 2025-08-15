#!/bin/bash
echo "Validating service status"
kubectl get pods -l app=brain-tasks-app --namespace default

# Optional: check if pods are running
RUNNING=$(kubectl get pods -l app=brain-tasks-app --namespace default --field-selector=status.phase=Running --no-headers | wc -l)
TOTAL=$(kubectl get pods -l app=brain-tasks-app --namespace default --no-headers | wc -l)

if [ "$RUNNING" -ne "$TOTAL" ] || [ "$TOTAL" -eq 0 ]; then
  echo "Not all pods are running"
  exit 1
fi

echo "All pods are running"
