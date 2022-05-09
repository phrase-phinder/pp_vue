auth:
	aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 564523032206.dkr.ecr.us-west-2.amazonaws.com

build:
	docker build -t pp_vue .

tag:
	docker tag pp_vue:latest 564523032206.dkr.ecr.us-west-2.amazonaws.com/pp_vue:latest

push:
	docker push 564523032206.dkr.ecr.us-west-2.amazonaws.com/pp_vue:latest

all:
	aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 564523032206.dkr.ecr.us-west-2.amazonaws.com
	docker build -t pp_vue .
	docker tag pp_vue:latest 564523032206.dkr.ecr.us-west-2.amazonaws.com/pp_vue:latest
	docker push 564523032206.dkr.ecr.us-west-2.amazonaws.com/pp_vue:latest
	aws ecs update-service --cluster pp-vue --service pp-vue --force-new-deployment

update:
	aws ecs update-service --cluster pp-vue --service pp-vue --force-new-deployment