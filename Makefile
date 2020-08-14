# Build variables
REGISTRY_URI :=registry.cn-beijing.aliyuncs.com/hanxin
RELEASE_VERSION :=$(shell git describe --always --tags)

build-thc_moss-image:
	@echo "version: $(RELEASE_VERSION)"
	docker build --no-cache -t $(REGISTRY_URI)/thc_moss:$(RELEASE_VERSION) .

push-image:
	docker tag $(REGISTRY_URI)/thc_moss:$(RELEASE_VERSION) $(REGISTRY_URI)/alert-gateway:latest
	docker push $(REGISTRY_URI)/thc_moss:$(RELEASE_VERSION)
	docker push $(REGISTRY_URI)/thc_moss:latest

release: build-thc_moss-image push-image
