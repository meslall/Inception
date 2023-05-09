NAME	= inception
all:
	@cd srcs ; docker-compose up --build
down:
	@cd srcs ; docker-compose down
clean:
	@docker rm -f $(docker ps -aq)
fclean:
	@docker system prune -a -f
	@docker volume rm -f $$(docker volume ls -q) &> /dev/null ; true
	@docker network rm -f $$(docker network ls -q) &> /dev/null ; true
re : fclean all
