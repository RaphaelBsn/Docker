
build : 
	docker build -t $(LOCATION)-docker.pkg.dev/$(PROJECT_ID)/$(REPOSITORY)/$(IMAGE_NAME):$(TAG) .


push :
	docker push $(LOCATION)-docker.pkg.dev/$(PROJECT_ID)/$(REPOSITORY)/$(IMAGE_NAME):$(TAG)

deploy :
	gcloud run deploy $(APP_NAME) \
	--image $(LOCATION)-docker.pkg.dev/$(PROJECT_ID)/$(REPOSITORY)/$(IMAGE_NAME):$(TAG) \
	--region $(LOCATION) \
	--allow-unauthenticated

all :  build push deploy