## Soat test backend

Test project to be part of youse colombia team (BackEnd)

*Use Sqlite for development purposes*
*Testing coverage 70%*
*Database populated with seeds from the guidelines pdf*


## Instalation

Install docker, and docker compose.

Create images for each of the individual projects, from their location:

clone first and in each folder type:

 - [soat-front](https://github.com/leonardocelis112/SoatTestFrontEnd)

        docker build -t soat-front .

 - [soat-back](https://github.com/leonardocelis112/SoatTestBackEnd)

        docker build -t soat-back .

## Run
    docker-compose up

Note: If you make any changes to the individual projects, you MUST delete
their previous running container and re run compose:

    docker-compose up --force-recreate

## The Hard Way

  Rails 5.0 installed
  clone the project and type bundle install
  rails s to serve
  bundle exec rspec for testing
