# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
dogs = [
  {
    id: 1,
    name: 'Kai',
    age: 2,
    enjoys: 'Eating anything on the ground (mostly sticks)',
    image: 'https://github.com/Rethora/dogpics/blob/main/kai.jpg?raw=true'
  },
  {
    id: 2,
    name: 'Kuma',
    age: 11,
    enjoys: 'Belly rubs',
    image: 'https://github.com/Rethora/dogpics/blob/main/kuma.jpg?raw=true'
  },
  {
    id: 3,
    name: 'Murphy',
    age: 11,
    enjoys: 'Sleeping anywhere but his own bed',
    image: 'https://github.com/Rethora/dogpics/blob/main/murphy.jpg?raw=true'
  },
  {
    id: 4,
    name: 'Sheldon',
    age: 3,
    enjoys: 'Long walks along the creek',
    image: 'https://github.com/Rethora/dogpics/blob/main/sheldon.jpg?raw=true'
  },
  {
    id: 5,
    name: 'Apollo',
    age: 4,
    enjoys: 'Only listening when he wants to',
    image: 'https://github.com/Rethora/dogpics/blob/main/apollo.jpg?raw=true'
  }
]

dogs.each do |attr|
  Dog.create attr 
  puts "created the dog #{attr}"
end