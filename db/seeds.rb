# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Account.create(name: 'Ian', balance: 100) 
Transaction.create(from_account: 'account1', to_account: 'account2', amount: 100, timestamp: Time.now)