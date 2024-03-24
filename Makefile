start-dev:
	docker compose -f docker-compose.development.yaml --env-file .env.development up -d --force-recreate --build

build-and-push:
	docker login -u ciemnyzenek
	docker buildx build --platform linux/amd64,linux/arm64 -t ciemnyzenek/vaultwarden-s3-backup:latest --push .

deploy-prod:
	docker compose -f docker-compose.production.yaml --env-file .env.production up -d
