# Spending Tracker :dollar:

A dynamic web application where the user can manage expenses to individual categories, then assign expenditure to one of those categories and display all transactions.

### Built With
* [Ruby](https://www.ruby-lang.org/en/)
* [Sinatra](http://sinatrarb.com/)
* [PostgreSQL](https://www.postgresql.org/)

### Project setup

<<<<<<< HEAD
### MVP

* The app should allow the user to create and edit merchants, e.g. Tesco, Amazon, ScotRail
* The app should allow the user to create and edit tags for their spending, e.g. groceries, entertainment, transport
* The user should be able to assign tags and merchants to a transaction, as well as an amount spent on each transaction.
* The app should display all the transactions a user has made in a single view, with each transaction's amount, merchant and tag, and a total for all transactions.
=======
Install required modules, create and seed database.

```ruby
bundle install
createdb spending_tracker
ruby db/seeds.rb
```

Using the project

Host the app locally using Sinatra, defaults to port 4567

```ruby
ruby app.rb
```
