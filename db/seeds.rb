# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
interests = ["3D printing", "Acting", "Baton twirling", "Board games", "Calligraphy", "Candle making", "Computer programming", "Cooking", "Coloring", "Cosplaying", "Couponing", "Creative writing", "Crocheting", "Cryptography", "Dance", "Digital arts", "Drama", "Drawing", "Do it yourself", "Electronics", "Embroidery", "Flower arranging", "Foreign language learning", "Gaming", "Gambling", "Genealogy", "Glassblowing", "Homebrewing", "Ice skating", "Jewelry making", "Jigsaw puzzles", "Juggling", "Knapping", "Knitting", "Kabaddi", "Knife making", "Lacemaking", "Lapidary", "Leather crafting", "Lego building", "Machining", "Macrame", "Magic", "Model building", "Listening to music", "Origami", "Painting", "Playing musical instruments", "Pottery", "Puzzles", "Quilting", "Reading", "Scrapbooking", "Sculpting", "Sewing", "Singing", "Sketching", "Soapmaking", "Sports", "Standup comedy", "Sudoku", "Table tennis", "Taxidermy", "Video gaming", "Watching movies", "Web surfing", "Wood carving", "Woodworking", "Worldbuilding", "Writing", "Yoga", "Yo-yoing"]

interests.map! do |interest|
  new_interest = Interest.create(name: interest.titleize)
end

values = ["Accountability", "Adventurousness", "Altruism", "Ambition", "Assertiveness", "Balance", "Commitment", "Community", "Compassion", "Competitiveness", "Contentment", "Cooperation", "Courtesy", "Creativity", "Curiosity", "Devoutness", "Diligence", "Discipline", "Diversity", "Elegance", "Empathy", "Equality", "Fairness", "Faith", "Family", "Fidelity", "Fitness", "Freedom", "Generosity", "Grace", "Happiness", "Hard Work", "Health", "Holiness", "Honesty", "Honor", "Humility", "Independence", "Intelligence", "Justice", "Leadership", "Love", "Loyalty", "Marriage", "Obedience", "Openness", "Originality", "Patriotism", "Peace", "Perfection", "Piety", "Positivity", "Reliability", "Selflessness", "Self-reliance", "Sensitivity", "Service", "Success", "Support", "Teamwork", "Timeliness", "Tolerance", "Traditionalism", "Truth", "Unity"]

values.map! do |value|
  new_value = Value.create(name: value.titleize)
end

cities = ['San Francisco', 'San Diego', 'Los Angeles', 'Santa Barbara', 'Sacramento']

experience_photos = ['http://www.seamless.com/finedining/img/vendormenuplustabcontentimages/lg_27331_0.jpg', 'http://25.media.tumblr.com/8de69d887367fa0ea41ba1c628fcad9f/tumblr_myvf7h7dKh1shjq15o1_1280.jpg', 'http://collegetimes.com/wp-content/uploads/2014/09/las.jpg', 'http://www.toastedontheinside.com/wp-content/uploads/2013/11/foodporn-34.jpg', 'http://nolavie.com/wp-content/uploads/2014/02/Pork-sliders-2.jpg', 'http://i.imgur.com/iPjkzUz.jpg', 'http://loreleynyc.com/gallery/photos/Food/beer_tasting_flight.jpg', 'https://img.vimbly.com/images/full_photos/scotch-1.jpg']

sea_lions =
  [ ['Andrew', 'Dye', 'https://secure.gravatar.com/avatar/5abc8c1476e25191a08feba0a23f3829.png?r=PG&amp;d=mm&amp;s=300'],
    ['Anna', 'MacDonald', 'https://secure.gravatar.com/avatar/99659b959801d235a8a7c213227008f9.png?r=PG&amp;d=mm&amp;s=300'],
    ['Dixon', 'Adair', 'https://secure.gravatar.com/avatar/a8936e98d319c6c8dad202d692aba2d1.png?r=PG&amp;d=mm&amp;s=30]0'],
    ['Bao', 'Tran', 'https://secure.gravatar.com/avatar/f038deaeb508bed3d78f624ca1028df9.png?r=PG&amp;d=mm&amp;s=300'],
    ['Curtis', 'Seaton', 'https://secure.gravatar.com/avatar/e74d3dcf95f680e762f88b3909f35f9f.png?r=PG&amp;d=mm&amp;s=300'],
    ['Danny', 'Lundy', 'https://secure.gravatar.com/avatar/ebed9794eb1db20cfbb0a63fc4d76bb9.png?r=PG&amp;d=mm&amp;s=300'],
    ['Deb', 'Wolfe', 'https://secure.gravatar.com/avatar/716c42ca68efd84a82e58a624f809b80.png?r=PG&amp;d=mm&amp;s=300'],
    ['Erin', 'Hyejin Kim', 'https://secure.gravatar.com/avatar/bc3161cfe66e944b2b207080149a2df4.png?r=PG&amp;d=mm&amp;s=300'],
    ['Ganesh', 'Balaji', 'https://secure.gravatar.com/avatar/ac871ebaa0628c6a83289e7c564af480.png?r=PG&amp;d=mm&amp;s=300'],
    ['Iulia', 'Soimaru', 'https://secure.gravatar.com/avatar/3d772ac9d054192808f55fac90a867c7.png?r=PG&amp;d=mm&amp;s=300'],
    ['Jacqueline', 'Hernandez', 'https://secure.gravatar.com/avatar/9e75c8c3c4d507fb24ec1bd0239ed2d7.png?r=PG&amp;d=mm&amp;s=30]0'],
    ['Janet', 'Brown', 'https://secure.gravatar.com/avatar/13de1fc4c41fb6214c540b2bd3aa256f.png?r=PG&amp;d=mm&amp;s=300'],
    ['Jeremy', 'Gagon', 'https://secure.gravatar.com/avatar/8a6027df29e3339dbe9e9cfa314c90ec.png?r=PG&amp;d=mm&amp;s=300'],
    ['Jonathan', 'Berk', 'https://secure.gravatar.com/avatar/3c962b80bfae0ff8e61b99ba032c89c2.png?r=PG&amp;d=mm&amp;s=300'],
    ['Kailash', 'Duraiswami', 'https://secure.gravatar.com/avatar/d71b25f17864f11928c53639eefa8bc4.png?r=PG&amp;d=mm&amp;s=]300'],
    ['Kevin', 'Ceballos', 'https://secure.gravatar.com/avatar/1475db0bc23485196d4cfb94e9c4a104.png?r=PG&amp;d=mm&amp;s=300'],
    ['Marko', 'Anton Potocnik', 'https://secure.gravatar.com/avatar/793240f33e505ec0af147eaefd94e628.png?r=PG&amp;d=mm&amp;s=30]0'],
    ['Matt', 'McDole', 'https://secure.gravatar.com/avatar/663dd748230392e54aec7879301dcac8.png?r=PG&amp;d=mm&amp;s=300'],
    ['Matthew', 'Lao', 'https://secure.gravatar.com/avatar/70a39a576cbafe46e62db83814105b3a.png?r=PG&amp;d=mm&amp;s=300'],
    ['Michael', 'Perez', 'https://secure.gravatar.com/avatar/abce251b8018346e771560d66db2b3a3.png?r=PG&amp;d=mm&amp;s=300'],
    ['Mikhail', 'Delos Trinos', 'https://secure.gravatar.com/avatar/80d04fcd03aeb5df3395e79594bc4143.png?r=PG&amp;d=mm&amp;s=30]0'],
    ['Peter', 'Brown', 'https://secure.gravatar.com/avatar/c6186e147a341a37f30e9ab54c8538ff.png?r=PG&amp;d=mm&amp;s=300'],
    ['Sofie', 'Garden', 'https://secure.gravatar.com/avatar/d42a49d8478e2cb45d41d04daa7ba9ee.png?r=PG&amp;d=mm&amp;s=300'],
    ['Stephanie', 'Lopez', 'https://secure.gravatar.com/avatar/62d0db03a04b24643e728391acac88ef.png?r=PG&amp;d=mm&amp;s=300'],
    ['Tony', 'Mai', 'https://secure.gravatar.com/avatar/0c45b9639c78f8a63b36f203c9079443.png?r=PG&amp;d=mm&amp;s=300'] ]
i = 0

40.times do
  parent = Parent.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: 'password'
    )
  parent.update(email: "user#{parent.id}@gmail.com") #allows us to sign in as seed users
  3.times do
    child = parent.children.create(
      first_name: sea_lions[i] ? sea_lions[i][0] : Faker::Name.first_name,
      last_name: sea_lions[i] ? sea_lions[i][1] : Faker::Name.last_name,
      city: cities.sample,
      state: 'CA',
      phone: rand.to_s[2..11],
      gender: ['male', 'female', 'other'].sample,
      sexual_preference: ['men', 'women', 'no preference'].sample,
      birthdate: Faker::Date.between(50.years.ago, 18.years.ago),
      bio: Faker::Company.bs,
      religion: ['Christian','Muslim','Buddhist', 'Atheist', 'Rastafarian', 'Pastafarian', 'Hindu', 'Sikh', 'Jewish', 'Shinto', 'Shamanist', 'Scientologist', 'Mormon'].sample,
      smoke: [true, false].sample,
      linkedin_url: Faker::Internet.url,
      facebook_url: Faker::Internet.url,
      embarrassing_moment: Faker::Hacker.say_something_smart,
      pf_image_1: sea_lions[i] ? sea_lions[i][2] : Faker::Avatar.image,
      pf_image_2: Faker::Avatar.image,
      pf_image_3: Faker::Avatar.image,
      pf_image_4: Faker::Avatar.image,
      pf_image_5: Faker::Avatar.image
      )
    5.times do
      child.interests << interests.sample
    end
    5.times do
      child.values << values.sample
    end
    i += 1
  end
end

children = Child.all.shuffle
15.times do #create pending dates
  Playdate.create(
    initiator_id: children.sample.id,
    recipient_id: children.sample.id,
    )
end
15.times do #create accepted dates
  playdate = Playdate.create(
    initiator_id: children.sample.id,
    recipient_id: children.sample.id,
    recipient_accepted: true,
    )

end
15.times do #create confirmed dates
  experience_time = Faker::Time.forward(50, :evening)
  playdate = Playdate.create(
    initiator_id: children.sample.id,
    recipient_id: children.sample.id,
    note: Faker::Lorem.paragraph,
    recipient_accepted: true,
    initiator_confirmed: true,
    recipient_confirmed: true,
    )
  playdate.create_experience(
    venue: Faker::Company.name,
    address: Faker::Address.street_address + ", " + cities.sample + ", CA",
    desc_summary: "Dinner for two",
    desc_note_1: "Intimate experience at their newest location",
    desc_note_2: "Famous for their gnocchi and fried calamari",
    desc_note_3: "Vegetarian and gluten-free friendly",
    price_per_person: rand(30..100),
    image: experience_photos.sample,
    experience_at: experience_time,
    )
  playdate.create_movie(
    venue: Faker::Company.name,
    address: Faker::Address.street_address + ", " + cities.sample + ", CA",
    title: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph,
    director: Faker::Name.name,
    rating: rand(40..100),
    image: Faker::Avatar.image,
    movie_at: experience_time + 2.hours,
    )
  playdate.save
end
15.times do #create paid dates
  experience_time = Faker::Time.forward(20, :evening)
  playdate = Playdate.create(
    initiator_id: children.sample.id,
    recipient_id: children.sample.id,
    note: Faker::Lorem.paragraph,
    recipient_accepted: true,
    initiator_confirmed: true,
    recipient_confirmed: true,
    initiator_paid: true,
    recipient_paid: true,
    )
  playdate.create_experience(
    venue: Faker::Company.name,
    address: Faker::Address.street_address + ", " + cities.sample + ", CA",
    desc_summary: "Dinner for two",
    desc_note_1: "Intimate experience at their newest location",
    desc_note_2: "Famous for their gnocchi and fried calamari",
    desc_note_3: "Vegetarian and gluten-free friendly",
    price_per_person: rand(30..100),
    image: experience_photos.sample,
    experience_at: experience_time,
    )
  playdate.create_movie(
    venue: Faker::Company.name,
    address: Faker::Address.street_address + ", " + cities.sample + ", CA",
    title: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph,
    director: Faker::Name.name,
    rating: rand(40..100),
    image: Faker::Avatar.image,
    movie_at: experience_time + 2.hours,
    )
  playdate.save

end
