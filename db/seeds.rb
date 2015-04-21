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

20.times do
  parent = Parent.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: 'password'
    )
  5.times do
    child = parent.children.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      city: cities.sample,
      state: 'CA',
      phone: Faker::PhoneNumber.phone_number,
      gender: ['male', 'female', 'other'].sample,
      sexual_preference: ['men', 'women', 'no preference'].sample,
      birthdate: Faker::Date.between(50.years.ago, 18.years.ago),
      bio: Faker::Company.bs,
      religion: ['Christian','Muslim','Buddhist', 'Atheist', 'Rastafarian', 'Pastafarian', 'Hindu', 'Sikh', 'Jewish', 'Shinto', 'Shamanist', 'Scientologist', 'Mormon'].sample,
      smoke: [true, false].sample,
      linkedin_url: Faker::Internet.url,
      facebook_url: Faker::Internet.url,
      embarrassing_moment: Faker::Hacker.say_something_smart,
      pf_image_1: Faker::Avatar.image,
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
  end
end

children = Child.all.shuffle
10.times do #create pending dates
  Playdate.create(
    initiator_id: children.sample.id,
    recipient_id: children.sample.id,
    )
end
10.times do #create accepted dates
  playdate = Playdate.create(
    initiator_id: children.sample.id,
    recipient_id: children.sample.id,
    recipient_accepted: true,
    )

end
10.times do #create confirmed dates
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
    image: Faker::Avatar.image,
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
10.times do #create paid dates
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
    image: Faker::Avatar.image,
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
