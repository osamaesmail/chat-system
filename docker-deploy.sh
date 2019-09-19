#!/bin/bash

# increase host virtual memory. (for more information: https://www.elastic.co/guide/en/elasticsearch/reference/current/vm-max-map-count.html)
sudo sysctl -w vm.max_map_count=262144

# run services
sudo docker-compose build && sudo docker-compose down -v && sudo docker-compose up -d

# show docker logs
sudo docker-compose logs -f

