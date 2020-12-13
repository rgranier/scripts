#!/usr/bin/sh

echo "Running the info gathering commands.\n"

echo "\nGET NODES"
kubectl get nodes

echo "\nGET PODS"
kubectl get pods

echo "\nGET DEPLOYMENTS"
kubectl get deployments


echo "\nGET REPLICA SETS"
kubectl get rs

echo "\nGET SERVICES"
kubectl get services

echo "\n================================================================================"
echo "\nGET CONFIG VIEW"
kubectl config view

echo "\nGET CLUSTER INFO"
kubectl cluster-info

echo "\n================================================================================"
echo "\nDone\n"
