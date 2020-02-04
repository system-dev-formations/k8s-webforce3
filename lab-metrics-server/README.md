# lab metrics-server
## installation 
```shell script
   git clone https://github.com/cesigit/metrics-server.git
   cd metrics-server
   k create f deploy/1.8+
```
Attendre quelques temps avant d'obtenir des metriques  
```shell script
    k top nodes 
    k top pods 
``` 