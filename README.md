## Spending Tracker :dollar:

I had one week to build build a Web application where the user can manage expenses to individual categories, then assign expenditure to one of those categories and display all transactions.

During this project I consolidated and expanded on everything I had learnt in the previous 3 weeks @ CodeClan.

* Ruby
* MiniTest
* Sinatra (REST, MVC)
* PostgreSQL
* HTML & CSS
* Git & GitHub
* Agile methodologies

Project setup
Install required modules, create and seed database.

bundle install
createdb spending_tracker
ruby db/seeds.rb
Using the project

Host the app locally using Sinatra, defaults to port 4567

ruby app.rb

### MVP

* The app should allow the user to create and edit merchants, e.g. Tesco, Amazon, ScotRail
* The app should allow the user to create and edit tags for their spending, e.g. groceries, entertainment, transport
* The user should be able to assign tags and merchants to a transaction, as well as an amount spent on each transaction.
* The app should display all the transactions a user has made in a single view, with each transaction's amount, merchant and tag, and a total for all transactions.
