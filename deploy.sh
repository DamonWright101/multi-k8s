docker build -t dwright101/multi-client:latest -t dwright101/multi-client:$GIT_SHA -f ./client/Dockerfile ./client
docker build -t dwright101/multi-server:latest -t dwright101/multi-server:$GIT_SHA -f ./server/Dockerfile ./server
docker build -t dwright101/multi-worker:latest -t dwright101/multi-worker:$GIT_SHA -f ./worker/Dockerfile ./worker

docker push dwright101/multi-client:latest
docker push dwright101/multi-server:latest
docker push dwright101/multi-worker:latest

docker push dwright101/multi-client:$GIT_SHA
docker push dwright101/multi-server:$GIT_SHA
docker push dwright101/multi-worker:$GIT_SHA

kubectl apply -f k8s
kubectl set image deployments/client-deployment client=dwright101/multi-client:$GIT_SHA
kubectl set image deployments/server-deployment server=dwright101/multi-server:$GIT_SHA
kubectl set image deployments/worker-deployment worker=dwright101/multi-worker:$GIT_SHA