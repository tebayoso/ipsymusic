# Welcome to IpsyMusic!

This Code Challenge was requested by IpsyMusic as a skill test for a Senior Ruby on Rails Engineer.

-   Create API endpoints that enable the following:
    -   Albums
        -   creating and deleting albums
        -   changing album details (name, artist, album art)
        -   adding/removing songs
    -   Artists (musicians/bands)
        -   creating and deleting artists
        -   changing artist details (name, bio, albums)
    -   Songs
        -   creating and deleting songs
        -   changing song details (name, duration, genre, album, artist, etc)
        -   songs can be featured and featured songs have a here image and extra texts to describe or promote it
    -   Playlists
        -   creating and deleting playlists
        -   changing playlist name
        -   adding/removing songs from the playlist

# Tech Stack

I went full Rails for this challenge as it's my main programming language. But I wanted to test some new technologies or already know, but rusty.
Stack is composed by:

- Ruby on Rails 5.2 with *--api* downgrade.
- Docker and Docker Compose to build the microservices network
  - MySQL as relational database
  - ElasticSearch as search engine
  - Redis, not used, but available, to handle delayed jobs.
- Swagger to document the API
- Rspec, for full text coverage
- ActiveModelSerializers to fasten the JSON serializing

## Setup

If you want to taste the development mode, just install ElasticSearch and MySQL in your local and run the standard commands:

    $ rake db:reset
    $ rails s
To move directly to an already setup environment, go full docker:

    $ docker-compose up

## Deploy

- I wanted to go full CI over AWS, but didn't had enough time, I decided to go with Capistrano and Digital Ocean.
- The capistrano script works under the standard definition.
- I configured the whole Dropplet in DO in under 1 hour following some guidelines for a common stack.

## Pending Tasks
- Document all resources. I documented a single one, the album resource
- Write the callbacks and search methods for all resources
- Unify the Albums+Playlists under a single model using Single Table Inheritance
- Write the featured songs API (I wanted to have a better definition on this task)
- Implement ActiveModelSerializer on all models

## Testing
You can run the test suite inside docker containers by using:

    $ rspec spec/

Be sure you have ElasticSearch running or the search album spec will fail.
