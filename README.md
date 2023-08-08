# Web application "Event planner"

Nowadays we get a lot of information, and it's all hard to remember, and the "Event Planner" will help you with this.
Whether you are hosting a business event, festival or any other event, the "Event Planner" can make your life easier.
Using the app, you won't have to remember events because it will remind you of an upcoming event if you want to. 
You can also delete events that have already happened.

## Before the using application your should install following tools:

- [RVM](http://rvm.io/rvm/install) (Use Ruby 3.1.2)
- [Rails 7+](https://rubygems.org/gems/rails/versions/7.0.6)
- [PostgreSQL](https://www.postgresql.org/download/)
- [Nodejs](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm)
- [Docker](https://docs.docker.com/engine/install/)
- [Docker without sudo](https://docs.docker.com/engine/install/linux-postinstall/)
- [docker-compose](https://docs.docker.com/compose/install/)

## How to use the app

##### 1. Check out the repository

```commandline
git clone git@github.com:The7Fame/trainee-planner.git
cd trainee-planner
```


##### 2. Configure database.yml file

Create `.env` file and fill in the template `.env.template`, and then rename `.env.template` to `.env`
 
#### 3. Your can use docker-compose to run the app or without it

- with docker-compose

### Start the app with the next command

```commandline
docker-compose up -d --build
```

Your can also run tests to be sure that everything will work as it needs to

```commandline
docker exec -ti trainee /bin/sh
bundle exec rspec
```

- without docker-compose

Create and setup the database with the following commands:

```commandline
bundle install
bin/rails db:create db:migrate db:seed
```

Run the tests before starting the application

```commandline
bundle exec rspec
```


Start the rails server

```commandline
bin/rails s
```


