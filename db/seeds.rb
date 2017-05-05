# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(first_name: "Mike-the-Admin", last_name: "Silb", email: "ms@email.com", password: "123456", role: "admin")
User.create!(first_name: "Sammy", last_name: "Silb", email: "ss@email.com", password: "123456")
Nbafinal.create!(year: 1959, champion: "Celtics", numgames: 4)
Nbafinal.create!(year: 1962, champion: "Celtics", numgames: 7)
Nbafinal.create!(year: 1963, champion: "Celtics", numgames: 6)
Nbafinal.create!(year: 1965, champion: "Celtics", numgames: 5)
Nbafinal.create!(year: 1966, champion: "Celtics", numgames: 7)
Nbafinal.create!(year: 1968, champion: "Celtics", numgames: 6)
Nbafinal.create!(year: 1969, champion: "Celtics", numgames: 7, mvp: "Jerry West")
Nbafinal.create!(year: 1984, champion: "Celtics", numgames: 7, mvp: "Larry Bird")
Nbafinal.create!(year: 1985, champion: "Lakers", numgames: 6, mvp: "Kareem Abdul-Jabbar")
Nbafinal.create!(year: 1987, champion: "Lakers", numgames: 6, mvp: "Magic Johnson")
Nbafinal.create!(year: 2008, champion: "Celtics", numgames: 6, mvp: "Paul Pierce")
Nbafinal.create!(year: 2010, champion: "Lakers", numgames: 7, mvp: "Kobe Bryant")
