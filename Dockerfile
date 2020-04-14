FROM python:3.7

# Seting env variables
ENV PYTHONUNBUFFERED 1
ARG DJANGO_PORT
ENV DJANGO_PORT=$DJANGO_PORT

# Creating folder for API
RUN mkdir /electroventory_api

# Setting the workspace
WORKDIR /electroventory_api

# Copying local files into API folder
COPY . /electroventory_api/

# Installing pybuilder and dependencies
RUN pip install --pre pybuilder
# Installing dependencies
RUN pyb install_dependencies

# Running Django Server
CMD ["sh", "-c", "python manage.py runserver 0.0.0.0:$DJANGO_PORT"]