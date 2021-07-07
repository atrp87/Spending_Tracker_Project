# Spending Tracker.

A traditional multiple-page applications where the user can manage expenses to individual categories, then assign expenditure to one of those categories and display all transactions.

<img src="images/hero1.png" width="700" height="400">

### Built With
* [Ruby](https://www.ruby-lang.org/en/)
* [Sinatra](http://sinatrarb.com/)
* [PostgreSQL](https://www.postgresql.org/)
* [Bootstrap](https://getbootstrap.com/)

### Project setup
Install required modules, create and seed database (You must have Ruby, Sinatra, and PostgreSQL installed).

```ruby
bundle install
createdb spending_tracker
psql -d spending_tracker -f db/spending_tracker.sql
ruby db/seeds.rb
```

#### Using the project

```ruby
ruby app.rb
```
Host the app locally using Sinatra, defaults to port http://localhost:4567/