.PHONY: build run

build:
	docker build \
		-t neo4j-node \
		.

run:
	docker run \
		--rm \
		-it \
		-v "$(PWD)/exercises:/app/exercises" \
		neo4j-node \
		bash
