  ## Rolling update
   
   ```shell script
     k create -f curl.yaml -n kube-public  
     k create -f frontend.yaml
     k create -f webapp-service.yaml    
     chmod +x curl-test.sh
     ./curl-test.sh
     # ouvrir un second shell pour modifier l'objet deployment k8s directement
     k edit deploy  frontend 
      kubectl rollout status deployment/frontend  
      kubectl rollout history deployment/frontend
      kubectl rollout undo deployment/frontend
   ```