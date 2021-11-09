#!/bin/bash
docker run -it --rm -p 9090:8080 -v $(pwd):/usr/local/structurizr structurizr/lite