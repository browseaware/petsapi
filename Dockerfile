#
# PetsAPI Dockerfile
#
#

#Pull base image
FROM python:3.4.5-slim

#Get some custom packages
RUN apt-get update && apt-get install -y \
    build-essentials \
    make \
    gcc \
    python3-dev \
    mongodb

## make a local directory
RUN mkdir /Flask/PetsAPI

# now copy call the files in this directory to /code
ADD . .

RUN pip install -r requirements.txt

#Listen to port 5000 at runtime
EXPOSE 5000

#start the app server

CMD python manage.py runserver