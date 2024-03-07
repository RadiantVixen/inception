all :
	docker compose -f srcs/docker-compose.yml up --build -d
clean :
	sudo rm -rf /home/aatki/data/wordpress/*
	docker compose -f srcs/docker-compose.yml down -v
fclean : clean
	docker compose -f srcs/docker-compose.yml
	docker system prune -af

re : clean all
