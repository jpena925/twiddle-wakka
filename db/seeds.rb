# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'seeding! 🌱🌱🌱'

User.create(email: "boba_queen@twiddlewakka.com", password: 'boba4lyfe', bio: 'The coolest boba addict ever.', 
    name: "Rebekah", github: 'https://github.com/rebekah-zhou', linkedin: 'linkedin.com/in/rebekahzhou',
    blog: 'https://medium.com/@rebekahzhou')

User.create(email: 'adi@twiddlewakka.com', password: 'password', bio: 'insert bio here', 
    name: 'Adeline', github: 'https://github.com/adelinealmanzar', linkedin: 'https://www.linkedin.com/in/adeline-almanzar/',
    blog: 'https://dev.to/adelinealmanzar')

User.create(email: 'davidsands@twiddlewakka.com', password: 'guitar', bio: "Can play guitar, but only when not sick, not out of town, or fingers aren't broken.", 
    name: 'David', github: 'https://github.com/', linkedin: 'https://www.linkedin.com/',
    blog: 'https://dev.to/')

User.create(email: 'mr_pena@twiddlewakka.com', password: 'bassoon', bio: 'Pro tennis player. Dabbles in bassoon.', 
    name: 'Jack', github: 'https://github.com/', linkedin: 'https://www.linkedin.com/',
    blog: 'https://dev.to/')

Project.create(image_url: './resources/ACNHub.gif', 
    github: 'https://github.com/rebekah-zhou/animalcrossinghub',
    title: 'ACHub', 
    description: 'A web app featuring villagers, fossils, and critters from Animal Crossing New Horizons.')

UserProject.create(user_id: 1, project_id: 1)
UserProject.create(user_id: 2, project_id: 1)

Post.create(text: 'The T has been spilt.', user_id: 1)
Post.create(text: 'https://dev.to/adelinealmanzar/react-context-vs-containment-319g', user_id: 2)
Post.create(text: 'Ummmmmmm, does this work?', user_id: 1)

Relationship.create(follower_id: 2, followee_id: 1)
Relationship.create(follower_id: 1, followee_id: 2)

Comment.create(text: "This is my first post, y'all.", :commentable => Post.first, user_id: 1)
Comment.create(text: 'Wow, thanks for the info!', :commentable => Post.second, user_id: 1)
Comment.create(text: 'Thanks for reading. :)', :commentable => Post.second, user_id: 2)
Comment.create(text: 'Yes, it seems to be working.', :commentable => Post.third, user_id: 2)

puts 'done seeding! 🌱🌱🌱'