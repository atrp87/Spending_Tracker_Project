<<<<<<< HEAD
# Spending Tracker.

A traditional multiple-page applications where the user can manage expenses to individual categories, then assign expenditure to one of those categories and display all transactions.

<img src="images/hero1.png" width="700" height="400">
=======
# Money Bulk :dollar:

Web application where the user can manage expenses to individual categories, then assign expenditure to one of those categories and display all transactions.

<img src="public/money_bulk.png" width="700" height="400">

* MVC Design
* CRUD Functionality
* RESTful routes
* Filter transactions by category and merchant name
>>>>>>> f07e4445e4782c8c832f36c7eb00bbcc684a2d7d

## Built With
* [Ruby](https://www.ruby-lang.org/en/)
* [Sinatra](http://sinatrarb.com/)
* [PostgreSQL](https://www.postgresql.org/)
* [Bootstrap](https://getbootstrap.com/)

<<<<<<< HEAD
### Project setup
Install required modules, create and seed database (You must have Ruby, Sinatra, and PostgreSQL installed).
=======

## Project setup
Install required modules, create and seed database (You must have Ruby, Sinatra, and PSQL installed).
>>>>>>> f07e4445e4782c8c832f36c7eb00bbcc684a2d7d

```ruby
bundle install
createdb spending_tracker
psql -d spending_tracker -f db/spending_tracker.sql
ruby db/seeds.rb
```

<<<<<<< HEAD
#### Using the project
=======
## Running the app

Host the app locally using Sinatra, defaults to port http://localhost:4567/
>>>>>>> f07e4445e4782c8c832f36c7eb00bbcc684a2d7d

```ruby
ruby app.rb
```
Host the app locally using Sinatra, defaults to port http://localhost:4567/