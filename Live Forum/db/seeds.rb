# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


category = Category.create(:category => "ruby")
category = Category.create(:category => "rails")
category = Category.create(:category => "html")
category = Category.create(:category => "java")
category = Category.create(:category => "c")
category = Category.create(:category => "sql")
category = Category.create(:category => "ajax")
category = Category.create(:category => "net")
category = Category.create(:category => "general")

user = User.new
user.username = "admin"
user.email = "admin@email.com"
user.password = "admin"
user.password_confirmation = "admin"
user.admin = 1
user.save

user = User.new
user.username = "admin1"
user.email = "admin1@email.com"
user.password = "admin1"
user.password_confirmation = "admin1"
user.admin = 1
user.save
