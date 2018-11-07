Setting up helm for GKE
=======================


```
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get > get_hel | bash
kubectl create clusterrolebinding $RULE --clusterrole=cluster-admin
kubectl create clusterrolebinding $RULE --clusterrole=cluster-admin --serviceaccount=$NAMESPACE:$SERVICE_ACCOUNT
helm init --service-account $SERVICE_ACCOUNT --upgrade
helm install stable/nginx-ingress --name my-nginx --set rbac.create=true
```
