set-params-ip:
	docker network inspect bridge
	code /etc/docker/daemon.json
	sudo systemctl daemon-reload
	sudo systemctl stop docker
	sudo systemctl start docker

start-registery:
	docker-compose -f docker-registery.yml up --build -d

clean-registery:
	docker-compose -f docker-registery.yml down -v

docker-build:
	docker build -t spark3 .
	docker tag spark3 192.168.0.1:5000/spark3:v1
	

docker-run:
	docker run -p 3000:80 --name spark3 -it --rm 192.168.0.1:5000/spark3:v1

docker-push:
	docker push 192.168.0.1:5000/spark3:v1

check-registry:
	curl -X GET http://192.168.0.1:5000/v2/spark3/tags/list

del-minikube:
	minikube delete

init-minikube:
	minikube start --insecure-registry="192.168.0.1:5000" --memory 8192 --cpus 4
	minikube ip
	minikube status
	minikube dashboard

all-deploy:
	kubectl apply -f deployment/

delete-all-deploy:
	kubectl delete -f deployment/

logging:
	kubectl get all
	kubectl logs -f pod/pod-id