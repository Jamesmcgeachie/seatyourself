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
c4 = Category.create(category_name: "Japanese")
c5 = Category.create(category_name: "Greek")
c6 = Category.create(category_name: "Middle Eastern")
c7 = Category.create(category_name: "Speciality Burgers")

u1 = User.create(first_name: "Avi", last_name: "Jham", email: "avi@avi.com", password: "blah", password_confirmation: "blah")
u2 = User.create(first_name: "James", last_name: "McGeachie", email: "james@james.com", password: "blah", password_confirmation: "blah")
u3 = User.create(first_name: "Billy", last_name: "Jefferson", email: "bj@bj.com", password: "blah", password_confirmation: "blah")

u1.create_owned_restaurant(name: "Taco Bell", capacity: 200, category_id: 1, street_number: "220", street_name:"King Street West", city:"toronto",country:"Canada",province:"Ontario")
Restaurant.create(name: "Subway", capacity: 30, category_id: 1, street_number: "220", street_name:"King Street West", city:"toronto",country:"Canada",province:"Ontario")
Restaurant.create(name: "Taste of China", capacity: 300, category_id: 2, street_number: "220", street_name:"King Street West", city:"toronto",country:"Canada",province:"Ontario")
Restaurant.create(name: "Astoria", capacity: 200, category_id: 5, street_number: "220", street_name:"King Street West", city:"toronto",country:"Canada",province:"Ontario") 
Restaurant.create(name: "Memories of Japan", capacity: 200, category_id: 4, street_number: "220", street_name:"King Street West", city:"toronto",country:"Canada",province:"Ontario")
Restaurant.create(name: "Banjara", capacity: 300, category_id: 3 ,street_number: "220", street_name:"King Street West", city:"toronto",country:"Canada",province:"Ontario")
Restaurant.create(name: "Kinton Ramen", capacity: 150, category_id: 4, street_number: "220", street_name:"King Street West", city:"toronto",country:"Canada",province:"Ontario")
Restaurant.create(name: "Eastern Promise", capacity: 150, category_id: 2, street_number: "220", street_name:"King Street West", city:"toronto",country:"Canada",province:"Ontario")
Restaurant.create(name: "Schwarma King", capacity: 20, category_id: 6, street_number: "220", street_name:"King Street West", city:"toronto",country:"Canada",province:"Ontario")
Restaurant.create(name: "Taste of Turkey", capacity: 50, category_id: 6, street_number: "220", street_name:"King Street West", city:"toronto",country:"Canada",province:"Ontario")
Restaurant.create(name: "Armenian Kitchen", capacity: 70, category_id: 6, street_number: "220", street_name:"King Street West", city:"toronto",country:"Canada",province:"Ontario")
Restaurant.create(name: "Sushi King", capacity: 70, category_id: 4 ,street_number: "220", street_name:"King Street West", city:"toronto",country:"Canada",province:"Ontario")
Restaurant.create(name: "Burger King", capacity: 70, category_id: 1 ,street_number: "220", street_name:"King Street West", city:"toronto",country:"Canada",province:"Ontario")
Restaurant.create(name: "McDonalds", capacity: 70, category_id: 1, street_number: "220", street_name:"King Street West", city:"toronto",country:"Canada",province:"Ontario")
u2.create_owned_restaurant(name: "Burger Priest", capacity: 30, category_id: 7, street_number: "220", street_name:"King Street West", city:"toronto",country:"Canada",province:"Ontario")
Restaurant.create(name: "Gangster Burger", capacity: 20, category_id: 7 ,street_number: "220", street_name:"King Street West", city:"toronto",country:"Canada",province:"Ontario")
Restaurant.create(name: "P & L Burger", capacity: 30, category_id: 7, street_number: "220", street_name:"King Street West", city:"toronto",country:"Canada",province:"Ontario")
Restaurant.create(name: "Taste of Athens", capacity: 60, category_id:1, street_number: "220", street_name:"King Street West", city:"toronto",country:"Canada",province:"Ontario")
