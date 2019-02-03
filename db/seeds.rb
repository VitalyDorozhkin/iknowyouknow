# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
UserRole.create(status:"admin")
UserRole.create(status:"user")

User.create(name:"Vitaly", lastname: "Dorozhkin", age:17, login: "admin", password: "password", user_role: UserRole.find_by_status("admin"))
User.create(name:"Vasiliy", lastname: "Sikorskiy", age:33, login: "Vasiliy", password: "password", user_role: UserRole.find_by_status("user"))
User.create(name:"Petr", lastname: "First", age:33, login: "Petr1", password: "First", user_role: UserRole.find_by_status("user"))
User.create(name:"Petr", lastname: "Second", age:33, login: "Petr2", password: "Second", user_role: UserRole.find_by_status("user"))
User.create(name:"Petr", lastname: "Third", age:33, login: "Petr3", password: "Third", user_role: UserRole.find_by_status("user"))

Category.create(name:"IT")
Category.create(name:"Business")
Category.create(name:"Building")

Subject.create(name:"Programming", category: Category.find_by_name("IT"))
Subject.create(name:"Marketing", category: Category.find_by_name("Business"))
Subject.create(name:"Ship-building", category: Category.find_by_name("Building"))

Service.create(name:"Ruby", price:1000, teacher: User.find_by_login("Vasiliy"), subject: Subject.find_by_name("Programming"))
Service.create(name:"Shop in China", price:1000, teacher: User.find_by_login("Vasiliy"), subject: Subject.find_by_name("Marketing"))
Service.create(name:"JS", price:1000, teacher: User.find_by_login("admin"), subject: Subject.find_by_name("Programming"))
Service.create(name:"How to make the fastest wood ship", price:1000, teacher: User.find_by_login("Petr1"), subject: Subject.find_by_name("Ship-building"))

Order.create(service: Service.find_by_name("Ruby"), student: User.find_by_login("admin"))
Order.create(service: Service.find_by_name("Ruby"), student: User.find_by_login("Petr1"))
Order.create(service: Service.find_by_name("How to make the fastest wood ship"), student: User.find_by_login("Petr2"))
Order.create(service: Service.find_by_name("Shop in China"), student: User.find_by_login("Petr1"))
Order.create(service: Service.find_by_name("JS"), student: User.find_by_login("Petr3"))

