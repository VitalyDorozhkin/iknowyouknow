# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
UserRole.create(status:"admin")
UserRole.create(status:"user")

User.create(name:"Vitaly", lastname: "Dorozhkin", age:17, login: "admin", password: "password", user_role: UserRole.find_by_status("admin"), phone: 88005553535, email:"email@google.com")
User.create(name:"Vasiliy", lastname: "Sikorskiy", age:33, login: "Vasiliy", password: "password", user_role: UserRole.find_by_status("user"), phone: 88005553535, email:"email@google.com")
User.create(name:"Petr", lastname: "First", age:33, login: "Petr1", password: "password", user_role: UserRole.find_by_status("user"), phone: 88005553535, email:"email@google.com")
User.create(name:"Petr", lastname: "Second", age:30, login: "Petr2", password: "password", user_role: UserRole.find_by_status("user"), phone: 88005553535, email:"email@google.com")
User.create(name:"Petr", lastname: "Third", age:20, login: "Petr3", password: "password", user_role: UserRole.find_by_status("user"), phone: 88005553535, email:"email@google.com")

User.create(name:"Alex", lastname: "Petrov", age:17, login: "AlexPetrov", password: "password", user_role: UserRole.find_by_status("user"), phone: 88005553535, email:"email@google.com")
User.create(name:"Petr", lastname: "Alexeev", age:32, login: "PetrAlexeev", password: "password", user_role: UserRole.find_by_status("user"), phone: 88005553535, email:"email@google.com")
User.create(name:"Bill", lastname: "Gates", age:63, login: "Bill", password: "password", user_role: UserRole.find_by_status("user"), phone: 88005553535, email:"email@google.com")
User.create(name:"Elon", lastname: "Musk", age:47, login: "IronMan", password: "password", user_role: UserRole.find_by_status("admin"), phone: 88005553535, email:"email@google.com")
User.create(name:"Danila", lastname: "Poperechniy", age:25, login: "Pirozhok_s_nichem", password: "password", user_role: UserRole.find_by_status("user"), phone: 88005553535, email:"email@google.com")




Category.create(name:"IT")
Category.create(name:"Business")
Category.create(name:"Building")
Category.create(name:"Space")
Category.create(name:"Weapons")
Category.create(name:"Humor")


Subject.create(name:"Programming", category: Category.find_by_name("IT"))
Subject.create(name:"OS", category: Category.find_by_name("IT"))
Subject.create(name:"Marketing", category: Category.find_by_name("Business"))
Subject.create(name:"Ship-building", category: Category.find_by_name("Building"))
Subject.create(name:"Information Science", category: Category.find_by_name("IT"))
Subject.create(name:"Colonization", category: Category.find_by_name("Space"))
Subject.create(name:"Stars", category: Category.find_by_name("Space"))
Subject.create(name:"Falcon-building", category: Category.find_by_name("Building"))
Subject.create(name:"For Zombies", category: Category.find_by_name("Weapons"))
Subject.create(name:"Memes", category: Category.find_by_name("Humor"))
Subject.create(name:"StandUp", category: Category.find_by_name("Humor"))
Subject.create(name:"Car-building", category: Category.find_by_name("Building"))



Service.create(name:"Ruby", price:1000, teacher: User.find_by_login("Vasiliy"), subject: Subject.find_by_name("Programming"))
Service.create(name:"C#", price:10000, teacher: User.find_by_login("admin"), subject: Subject.find_by_name("Programming"))
Service.create(name:"C++", price:10000, teacher: User.find_by_login("Bill"), subject: Subject.find_by_name("Programming"))
Service.create(name:"God of Windows", price:1200, teacher: User.find_by_login("Bill"), subject: Subject.find_by_name("OS"))
Service.create(name:"Shop in China", price:1000, teacher: User.find_by_login("Vasiliy"), subject: Subject.find_by_name("Marketing"))
Service.create(name:"JS", price:1000, teacher: User.find_by_login("admin"), subject: Subject.find_by_name("Programming"))
Service.create(name:"How to make the fastest wood ship", price:1000, teacher: User.find_by_login("Petr1"), subject: Subject.find_by_name("Ship-building"))
Service.create(name:"How to make the fastest car", price:1000, teacher: User.find_by_login("IronMan"), subject: Subject.find_by_name("Car-building"))
Service.create(name:"How to make the biggest space ship", price:1000, teacher: User.find_by_login("IronMan"), subject: Subject.find_by_name("Falcon-building"))
Service.create(name:"How to make FireGun for killing zombies", price:1000, teacher: User.find_by_login("IronMan"), subject: Subject.find_by_name("For Zombies"))
Service.create(name:"How to be MemeGod", price:10, teacher: User.find_by_login("IronMan"), subject: Subject.find_by_name("Memes"))
Service.create(name:"Go to Mars!", price:10, teacher: User.find_by_login("IronMan"), subject: Subject.find_by_name("Colonization"))
Service.create(name:"Count the stars", price:9990, teacher: User.find_by_login("IronMan"), subject: Subject.find_by_name("Stars"))
Service.create(name:"Humor Theory", price:50, teacher: User.find_by_login("Pirozhok_s_nichem"), subject: Subject.find_by_name("StandUp"))




Order.create(service: Service.find_by_name("Ruby"), student: User.find_by_login("admin"))
Order.create(service: Service.find_by_name("Ruby"), student: User.find_by_login("Petr1"))
Order.create(service: Service.find_by_name("How to make the fastest wood ship"), student: User.find_by_login("Petr2"))
Order.create(service: Service.find_by_name("Shop in China"), student: User.find_by_login("Petr1"))
Order.create(service: Service.find_by_name("JS"), student: User.find_by_login("Petr3"))

