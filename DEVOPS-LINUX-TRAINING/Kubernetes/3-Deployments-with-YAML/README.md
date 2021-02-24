# Deployments with YAML

### Create deployment Definition file
-  **Create a file:** cat > my-deployment.yaml (ctrl+d to save)

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp3-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: myapp3
  template: 
    metadata: # Dictionary
      name: myapp3-pod
      labels: # Dictionary 
        app: myapp3         
    spec:
      containers: # List
        - name: myapp3-container
          image: stacksimplify/kubenginx:3.0.0
          ports:
            - containerPort: 80
```

### Create Deployment
```
kubectl apply -f my-deployment.yaml
kubectl get deploy
kubectl get rs
kubectl get po
```

### Create service Definition file
-  **Create a file:** cat > my-service.yaml (ctrl+d to save)
```yaml
apiVersion: v1
kind: Service
metadata:
  name: deployment-nodeport-service
spec:
  type: NodePort 
  selector: 
    app: myapp3
  ports: 
    - name: http
      port: 80
      targetPort: 80
      nodePort: 31233
```

### Create NodePort Service
```
kubectl apply -f my-service.yaml
```

### List Service
```
kubectl get svc
```

### Get Public IP
```
kubectl get nodes -o wide
```

### Get all object created
```
kubectl get all
```

### Access Application
```
http://<Worker-Node-Public-IP>:31233
```

## Generate a deployment files
```
kubectl create deployment --image=nginx nginx --replicas=4 --dry-run=client -o yaml > nginx-deployment.yaml

kubectl create -f nginx-deployment.yaml
kubectl get deployment
kubectl get deployment
```

## See the deployment of nginx before creating
```
kubectl run nginx --image=nginx --dry-run -o yaml
kubectl run nginx --image=nginx --dry-run=client -o yaml > deploy.yml
```
```yaml
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: nginx
  name: nginx
spec:
  containers:
  - image: nginx
    name: nginx
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
```

## Login into a node
```
ssh <node name> and exit to get out
ssh Node01
```


## API References
- **Deployment:** https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.18/#deployment-v1-apps
