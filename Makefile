deploy: 
	docker compose up -d --build
stop:
	docker compose stop
undeploy:
	docker compose down