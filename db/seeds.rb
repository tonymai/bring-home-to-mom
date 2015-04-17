# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
interests = ["3D printing", "Acting", "Baton twirling", "Board games", "Calligraphy", "Candle", "making", "Computer", "programming", "Cooking", "Coloring", "Cosplaying", "Couponing", "Creative writing", "Crocheting", "Cryptography", "Dance", "Digital arts", "Drama", "Drawing", "Do it yourself", "Electronics", "Embroidery", "Flower arranging", "Foreign language learning", "Gaming", "Gambling", "Genealogy", "Glassblowing", "Homebrewing", "Ice", "skating", "Jewelry", "making", "Jigsaw", "puzzles", "Juggling", "Knapping", "Knitting", "Kabaddi", "Knife", "making", "Lacemaking", "Lapidary", "Leather", "crafting", "Lego", "building", "Machining", "Macrame", "Magic", "Model building", "Listening to music", "Origami", "Painting", "Playing musical instruments", "Pottery", "Puzzles", "Quilting", "Reading", "Scrapbooking", "Sculpting", "Sewing", "Singing", "Sketching", "Soapmaking", "Sports", "Standup comedy", "Sudoku", "Table tennis", "Taxidermy", "Video gaming", "Watching", "movies", "Web surfing", "Wood carving", "Woodworking", "Worldbuilding", "Writing", "Yoga", "Yo-yoing"]

interests.map! do |interest|
  Interest.create(name: interest)
end

10.times do
  parent = Parent.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: 'password'
    )
  2.times do
    child = parent.children.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      city: Faker::Address.city,
      state: Faker::Address.state_abbr,
      phone: Faker::PhoneNumber.phone_number,
      gender: ['male', 'female', 'other'].sample,
      sexual_preference: ['men', 'women', 'both'].sample,
      birthdate: Faker::Date.between(35.years.ago, 18.years.ago),
      bio: Faker::Company.bs,
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
  end
end
