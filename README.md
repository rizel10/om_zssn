# Zombie Social Survival Network

## Getting started

Clone project on any folder

This project uses bundler

```ruby
gem install bundler
```
Then run `bundle install`

Create a `config/database.yml` file (there is an example at config folder) and a database for the application

Next, run this task to set things up:

```console
$ rake db:create db:migrate db:seed
```

This will run all migrations and populate the database with bunch of initial item types.

To start the server run

```console
$ rails s
```

### Navigating through the api

I Used Postman (https://www.getpostman.com/) to navigate and perform tests on the API.

Here is the published Postman [Documentation](https://documenter.getpostman.com/view/630023/zombie-social-survival-network/RVtvpsRx) and [Collection](https://www.getpostman.com/collections/22eafd87b519583b2264)

## Personal Considerations
By now there are still a few things to fix, but the API is neat (although by now it still lacks automated tests)