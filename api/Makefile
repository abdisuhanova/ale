.PHONY: all_targets
all: build login push switch-cluster deploy
region = us-east-1
version = latest
account = $(shell aws sts get-caller-identity --query "Account" --output text)
repo = exchange-app-api
appname = api
replicas = 1
cluster = eks_cluster_project
stage = prod
include stage/$(stage)
secret = rds-secret-ap


build:

	docker build -t $(repo):$(version) .

login: 
	aws ecr get-login-password --region $(region) | docker login --username AWS --password-stdin $(account).dkr.ecr.$(region).amazonaws.com
	
push: login
	docker tag $(repo):$(version) $(account).dkr.ecr.$(region).amazonaws.com/$(repo):$(version)
	docker push $(account).dkr.ecr.$(region).amazonaws.com/$(repo):$(version)

deploy:
	echo $(secret)
	helm upgrade --install $(appname) k8s-chart-api/ --namespace $(namespace) --create-namespace \
	  --set applicationName=$(appname) \
	  --set replicaCount=$(replicas) \
  	  --set image.repo=$(account).dkr.ecr.$(region).amazonaws.com/$(repo) \
      --set image.tag=$(version) \
      --set port=3000 \
	  --set secretname=$(secret)



	  
          

