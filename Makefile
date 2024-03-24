start-dev:
	docker compose -f ./docker/docker-compose.yaml --env-file ./.env.local up -d --force-recreate --build

build-and-push:

