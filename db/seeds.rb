# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do

  user = User.new(
    name: Faker::SiliconValley.character,
    bio: Faker::SiliconValley.quote,
    email: "#{Faker::SiliconValley.character.delete(" ")}@gmail.com",
    age: rand(18..50),
    photo_url: ' '
    )

  user.save

end

5.times do

  user = User.new(
    name: Faker::SiliconValley.character,
    bio: Faker::SiliconValley.quote,
    email: "#{Faker::SiliconValley.character.delete(" ")}@gmail.com",
    age: rand(18..50),
    photo_url: ' '
    )

  user.save


  listing = Listing.new(
    max_party_size: 10,
    min_party_size: 2,
    price_per_person: rand(10..50),
    cuisine: Faker::SiliconValley.invention,
    description: Faker::SiliconValley.motto,
    lng: Faker::Address.longitude,
    lat: Faker::Address.latitude,
    user_id: user.id
  )

  listing.save
end
