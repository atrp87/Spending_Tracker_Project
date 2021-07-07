# Spending Tracker :dollar:

Web application where the user can manage expenses to individual categories, then assign expenditure to one of those categories and display all transactions.

<img src="images/hero.png" width="700" height="400">

* MVC Design
* CRUD Functionality
* RESTful routes
* Filter transactions by category and merchant name

## Built With
* [Ruby](https://www.ruby-lang.org/en/)
* [Sinatra](http://sinatrarb.com/)
* [PostgreSQL](https://www.postgresql.org/)
* [Bootstrap](https://getbootstrap.com/)


## Project setup
Install required modules, create and seed database (You must have Ruby, Sinatra, and PSQL installed).

```ruby
bundle install
createdb spending_tracker
psql -d spending_tracker -f db/spending_tracker.sql
ruby db/seeds.rb
```

## Running the app

Host the app locally using Sinatra, defaults to port http://localhost:4567/

```ruby
ruby app.rb
```
