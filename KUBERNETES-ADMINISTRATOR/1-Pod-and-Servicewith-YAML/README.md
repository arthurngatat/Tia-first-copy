# Kubernete pod and service manifest and imperative commands


## References
-  **Kubernetues documentation:** https://kubernetes.io/docs/concepts/overview/working-with-objects/kubernetes-objects/

-  **API Reference:**  https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.18/

-  **Pod API Reference:** https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.18/#pod-v1-core

-  **Service API Reference:** https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.18/#service-v1-core


### List all the node
```
kubectl get nodes
```


### Create a Pod
```
kubectl run <desired-pod-name> --image <Container-Image> --generator=run-pod/v1
kubectl run my-first-pod --image stacksimplify/kubenginx:1.0.0 --generator=run-pod/v1
kubectl run my-first-pod --image leonardtia/devops-pro-repos:contactform
kubectl run my-first-pod --image stacksimplify/kubenginx:1.0.0
```


### Pull nginx from docker hub and create a pod
```
kubectl run nginx --image nginx
kubectl run my-app --image httpd
```


### List pod
```
kubectl get pods
kubectl get po
kubectl get pods -o wide
```

## Pod declare manifest file will multiple containers
-  **Create a file:** cat > myapp-pod.yml (ctrl+d to save)

```yml
apiVersion: v1
kind: Pod
metadata:
  name: my-app-pod
  labels:
    app: my-app
    type: front-end
spec:
  containers:
    - name: nginx-container
      image: nginx
      ports:
        - containerPort: 80
    - name: my-web-app
      image: leonardtia/devops-pro-repos:contactform
      ports:
        - containerPort: 8080
```

## Pod declare manifest file will one container
-  **Create a file:** cat > myapp-pod.yml (ctrl+d to save)
```yml
apiVersion: v1
kind: Pod 
metadata:
  name: myapp-pod 
  labels: 
    app: myapp   
    tier: front-end     
spec:
  containers: 
    - name: myapp 
      image: stacksimplify/kubenginx:1.0.0
      ports:
        - containerPort: 80 
```

### Create a pod service and so on
```
kubectl create -f <YAML file name>
kubectl create -f myapp-pod.yml
```

### Update the service file when we modify it
```
kubectl apply -f <YAML file name>
kubectl apply -f myapp-pod.yml
```

### Describle a specific pod 
```
kubectl describe pod <pod name>
kubectl describe pod myapp-pod |less
```


### Describle all running pods
```
kubectl describe pod 
kubectl describe pod |less
```


### Get pod definition YAML output
```
kubectl get pod <pod name or service name> -o yaml
kubectl get pod myapp-pod -o yaml
kubectl get pod myapp-pod -o yaml |less
```


### Edit the YAML file of a pod
```
kubectl edit pod <pod name>
kubectl edit pod myapp-pod
```


### Describe the Pod
```
kubectl describe pod <Pod-Name>
kubectl describe pod myapp-pod
kubectl describe pod myapp-pod |less
```


### Create a NodePort and Expose Pod as a Service
```
kubectl expose pod <Pod-Name>  --type=NodePort --port=80 --name=<Service-Name>
kubectl expose pod myapp-pod  --type=NodePort --port=80 --name=my-first-service
```


### Delete a pod
```
kubectl delete pod <pod name>
kubectl delete pod my-first-pod
```


### Get all Objects in default namespace
```
kubectl get all
```

## Service declaration manifest file
-  **Create a file:** cat > myapp-pod-nodeport-service.yml (ctrl+d to save)

```yaml
apiVersion: v1
kind: Service
metadata:
  name: myapp-pod-nodeport-service 
  labels:
    app: front-end
spec:
  type: NodePort 
  selector: 
    app: myapp
  ports: 
    - name: http
      port: 80 
      targetPort: 80
      nodePort: 31231  
```


### Create a service
```
kubectl create -f myapp-pod-nodeport-service.yml
```

### Update the service definition file
```
kubectl apply -f myapp-pod-nodeport-service.yml
```


### Get Service Info
```
kubectl get service
kubectl get svc
```


### Delete Services
```
kubectl delete svc <service name>
OR
kubectl delete service <service name>
kubectl delete svc my-first-service
```

### Delete Pod
```
kubectl delete pod my-first-pod
```


### Get YAML Output of Pod & Service
```
kubectl get service myapp-pod-nodeport-service -o yaml  
kubectl get svc myapp-pod-nodeport-service -o yaml 
kubectl get service myapp-pod-nodeport-service -o yaml |less
```


### Edit the YAML file of a service
```
kubectl edit svc <service name>
kubectl edit svc myapp-pod-nodeport-service
```