# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Nbafinal.create!(year: 2008, champion: "Celtics", numgames: 6, mvp: "Paul Pierce")
Game.create!(date: '2008-06-05', score: "Lakers 88, Celtics 98", nbafinal_id: 1)
Game.create!(date: '2008-06-08', score: "Lakers 102, Celtics 108", nbafinal_id: 1)
Game.create!(date: '2008-06-10', score: "Celtics 81, Lakers 87", nbafinal_id: 1)
Game.create!(date: '2008-06-12', score: "Celtics 97, Lakers 91", nbafinal_id: 1)
Game.create!(date: '2008-06-15', score: "Celtics 98, Lakers 103", nbafinal_id: 1)
Game.create!(date: '2008-06-17', score: "Lakers 92, Celtics 131", nbafinal_id: 1)
Team.create!(teamname: "Lakers", nbafinal_id: 1)
Team.create!(teamname: "Celtics", nbafinal_id: 1)
