20.times do |n|
  name = Faker::Name.name
  age = rand(101)
  message = "私の出身地は#{Faker::Address.city}です。"

  User.create(
    name: name,
    age: age,
    message: message
  )
  
end