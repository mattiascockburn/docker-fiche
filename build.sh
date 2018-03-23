#!/bin/bash

docker build -t fiche:latest .
docker build -t fiche-www:latest -f Dockerfile.http .
