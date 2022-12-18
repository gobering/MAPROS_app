10.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               )
end

Label.create!(name: "歩行")
Label.create!(name: "車")
Label.create!(name: "自動車")