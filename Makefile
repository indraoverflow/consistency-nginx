up:
	docker compose up --build

down:
	docker compose down

logs:
	docker compose logs -f --tail=100

curl:
	curl -I http://localhost:7447/get

clean:
	docker system prune -af --volumes
