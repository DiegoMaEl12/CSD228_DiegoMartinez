.PHONY: gen setup

setup:
	dart pub global activate openapi_generator_cli

gen:
	openapi-generator generate -i ./openapi.yaml -g dart-dio --global-property apiTests=false,modelTests=false --additional-properties equalityCheckMethod=equatable,serializationLibrary=json_serializable,disallowAdditionalPropertiesIfNotPresent=true,pubLibrary=classifieds_api.classifieds_api,pubName=classifieds_api
	make build
	dart format ./

build:
	dart run build_runner build --delete-conflicting-outputs