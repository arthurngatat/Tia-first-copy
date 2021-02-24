### Initialize the ev env (multiple env)
This is because the manifest folde is 2 steps back
```
terraform init ../../manifests
```

### Plan (multiple env)
```
terraform plan -out=s1.tfplan ../../manifests
```

### Apply (multiple env)
```
terraform apply s1.tfplan 
```

### Destroy resources (multiple env)
```
terraform destroy  ../../manifests
```