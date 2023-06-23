.PHONY: all_targets
all: build login push deploy
region = us-east-1
version = latest
account = $(shell aws sts get-caller-identity --query "Account" --output text)
repo = exchange-app-web
stage = prod
cluster = eks_cluster_project
appname = web
include stage/$(stage)

build:
	docker build -t $(repo):$(version) .
login: 
	aws ecr get-login-password --region $(region) | docker login --username AWS --password-stdin $(account).dkr.ecr.$(region).amazonaws.com
push: login
	docker tag $(repo):$(version) $(account).dkr.ecr.$(region).amazonaws.com/$(repo):$(version)
	docker push $(account).dkr.ecr.$(region).amazonaws.com/$(repo):$(version)

deploy:
	helm upgrade --install $(appname) k8s-chart/ --namespace $(namespace) --create-namespace \
		--set applicationName=$(appname) \
		--set replicaCount=$(replicas) \
		--set image.repo=$(account).dkr.ecr.$(region).amazonaws.com/$(repo) \
		--set image.tag=$(version) \
		--set port=80 \
		--set hostname_var=$(hostname) \


	  


