
taos:
	docker build -t taos .

taos_up:
	mkdir -p ./data
	docker-compose -f docker-compose.yml up -d

taos_down:
	docker-compose -f docker-compose.yml down
