# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Blog.destroy_all
Skill.destroy_all
Portfolio.destroy_all

10.times do |blog|
  Blog.create!(
    title: "My blog post #{blog}",
    body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem
       accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae
       ab illo inventore veritatis et quasi architecto beatae vitae dicta 
       sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur
       aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione 
       voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum 
       quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam 
       eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat 
       voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam 
       corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur?
       Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam 
       nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas
       nulla pariatur?"
  )
end

puts "10 blogs created"

5.times do |skill|
  Skill.create!(
    title: "Python #{skill}",
    percent_utilized: 20   
  )
end
puts "5 skills created"

9.times do |portfolio_item|
  Portfolio.create!(
    title: "My portfolio #{portfolio_item}",
    subtitle: "Angular Portfolio",
    body: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusa
           ntium doloremque laudantium, totam rem aperiam, eaque ipsa 
           quae ab illo inventore veritatis et quasi architecto beatae vitae dicta 
           sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur 
           aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione 
           voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum 
           quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam 
           eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat 
           voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam 
           corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? 
           Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam
           nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas
           nulla pariatur?",
    main_image: "https://via.placeholder.com/600x400",
    thumb_image: "https://via.placeholder.com/350x200"
  )
end

puts "9 portfolio items created"
