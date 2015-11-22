# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

c1 = Category.create(category_name: "Fast Food")
c2 = Category.create(category_name: "Chinese")
c3 = Category.create(category_name: "Indian")

u1 = User.create(first_name: "Avi", last_name: "Jham", email: "avi@avi.com", password: "blah", password_confirmation: "blah")
u2 = User.create(first_name: "James", last_name: "McGeachie", email: "james@james.com", password: "blah", password_confirmation: "blah")
u3 = User.create(first_name: "Billy", last_name: "Jefferson", email: "bj@bj.com", password: "blah", password_confirmation: "blah")

u1.create_owned_restaurant(name: "Taco Bell", capacity: 200, category_id: 1)
u2.create_owned_restaurant(name: "Subway", capacity: 30, category_id: 1)
u2.create_owned_restaurant(name: "Taste of China", capacity: 300, category_id: 2)