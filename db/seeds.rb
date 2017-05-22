# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Nbafinal.create!(year: 2008, champion: "Celtics", numgames: 6, mvp: "Paul Pierce")
Nbafinal.create!(year: 2010, champion: "Lakers", numgames: 7, mvp: "Kobe Bryant")
Game.create!(date: '2010-06-03', score: "Celtics 89, Lakers 102", nbafinal_id: 12)
Game.create!(date: '2010-06-06', score: "Celtics 103, Lakers 94", nbafinal_id: 12)
Game.create!(date: '2010-06-08', score: "Lakers 91, Celtics 84", nbafinal_id: 12)
Game.create!(date: '2010-06-10', score: "Lakers 89, Celtics 96", nbafinal_id: 12)
Game.create!(date: '2010-06-13', score: "Lakers 86, Celtics 92", nbafinal_id: 12)
Game.create!(date: '2010-06-15', score: "Celtics 67, Lakers 89", nbafinal_id: 12)
Game.create!(date: '2010-06-17', score: "Celtics 79, Lakers 83", nbafinal_id: 12)
Game.create!(date: '2008-06-05', score: "Lakers 88, Celtics 98", nbafinal_id: 11)
Game.create!(date: '2008-06-08', score: "Lakers 102, Celtics 108", nbafinal_id: 11)
Game.create!(date: '2008-06-10', score: "Celtics 81, Lakers 87", nbafinal_id: 11)
Game.create!(date: '2008-06-12', score: "Celtics 97, Lakers 91", nbafinal_id: 11)
Game.create!(date: '2008-06-15', score: "Celtics 98, Lakers 103", nbafinal_id: 11)
Game.create!(date: '2008-06-17', score: "Lakers 92, Celtics 131", nbafinal_id: 11)
Team.create!(teamname: "Lakers", nbafinal_id: 12)
Team.create!(teamname: "Celtics", nbafinal_id: 12)
Team.create!(teamname: "Lakers", nbafinal_id: 11)
Team.create!(teamname: "Celtics", nbafinal_id: 11)
Team.create!(teamname: "Lakers", nbafinal_id: 10)
Team.create!(teamname: "Celtics", nbafinal_id: 10)
Team.create!(teamname: "Lakers", nbafinal_id: 9)
Team.create!(teamname: "Celtics", nbafinal_id: 9)
Team.create!(teamname: "Lakers", nbafinal_id: 8)
Team.create!(teamname: "Celtics", nbafinal_id: 8)
Team.create!(teamname: "Lakers", nbafinal_id: 7)
Team.create!(teamname: "Celtics", nbafinal_id: 7)
Team.create!(teamname: "Lakers", nbafinal_id: 6)
Team.create!(teamname: "Celtics", nbafinal_id: 6)
Team.create!(teamname: "Lakers", nbafinal_id: 5)
Team.create!(teamname: "Celtics", nbafinal_id: 5)
Team.create!(teamname: "Lakers", nbafinal_id: 4)
Team.create!(teamname: "Celtics", nbafinal_id: 4)
Team.create!(teamname: "Lakers", nbafinal_id: 3)
Team.create!(teamname: "Celtics", nbafinal_id: 3)
Team.create!(teamname: "Lakers", nbafinal_id: 2)
Team.create!(teamname: "Celtics", nbafinal_id: 2)
Team.create!(teamname: "Lakers", nbafinal_id: 1)
Team.create!(teamname: "Celtics", nbafinal_id: 1)
Game.create!(date: '1987-06-02', score: "Celtics 113, Lakers 126", nbafinal_id: 10)
Game.create!(date: '1987-06-04', score: "Celtics 122, Lakers 141", nbafinal_id: 10)
Game.create!(date: '1987-06-07', score: "Lakers 103, Celtics 109", nbafinal_id: 10)
Game.create!(date: '1987-06-09', score: "Lakers 107, Celtics 106", nbafinal_id: 10)
Game.create!(date: '1987-06-11', score: "Lakers 108, Celtics 123", nbafinal_id: 10)
Game.create!(date: '1987-06-14', score: "Celtics 93, Lakers 106", nbafinal_id: 10)
Game.create!(date: '1985-05-27', score: "Lakers 114, Celtics 148", nbafinal_id: 9)
Game.create!(date: '1985-05-30', score: "Lakers 109, Celtics 102", nbafinal_id: 9)
Game.create!(date: '1985-06-02', score: "Celtics 111, Lakers 136", nbafinal_id: 9)
Game.create!(date: '1985-06-05', score: "Celtics 107, Lakers 105", nbafinal_id: 9)
Game.create!(date: '1985-06-07', score: "Celtics 111, Lakers 120", nbafinal_id: 9)
Game.create!(date: '1985-06-09', score: "Lakers 111, Celtics 100", nbafinal_id: 9)
Game.create!(date: '1984-05-27', score: "Lakers 115, Celtics 109", nbafinal_id: 8)
Game.create!(date: '1984-05-31', score: "Lakers 121, Celtics 124", nbafinal_id: 8)
Game.create!(date: '1984-06-03', score: "Celtics 104, Lakers 137", nbafinal_id: 8)
Game.create!(date: '1984-06-06', score: "Celtics 129, Lakers 125", nbafinal_id: 8)
Game.create!(date: '1984-06-08', score: "Lakers 103, Celtics 121", nbafinal_id: 8)
Game.create!(date: '1984-06-10', score: "Celtics 108, Lakers 119", nbafinal_id: 8)
Game.create!(date: '1984-06-12', score: "Lakers 102, Celtics 111", nbafinal_id: 8)
