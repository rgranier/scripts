# CLOUD NATIVE SCRIPTS

## K8'S CHEATS

**STATUS**

```

    kubectl get nodes
    kubectl get pods
    kubectl get deployments
    kubectl get rs
    kubectl get services

    kubectl config view
    kubectl cluster-info

```




**CREATE (Deploying Nginx Example)**

```
kubectl apply -f ./nginx-svc.yaml
```

**DELETE (Deploying Nginx Example)**

```
kubectl delete services <>
kubectl delete deployment <>

```

## MINIKUBE CHEATS

**DEPLOY DOCKER HUB TO MINKUBE**

```
kubectl create deployment test-microservice --image=docker.io/rgranier/microservicerepo

```

**FORWARD A CONTAINER PORT TO A HOST (MINIKUBE)**

```
kubectl port-forward deployment/k8microservice 8000:80

```

## NOTES
