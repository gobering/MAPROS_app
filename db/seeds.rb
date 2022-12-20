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
Label.create!(name: "昼")
Label.create!(name: "夜")

DangerousSpot.create (
  [
    {
      address: "北海道",
      content: "もっと街灯つけろ",
      detail: "暗すぎ",
      latitude: 43.0681478940875,
      longitude: 141.3533256515991,
      user_id:1
    },
    {
      address: "沖縄",
      content: "話しかけてくるな",
      detail: "見知らぬ人に声かけられた",
      latitude: 26.213864548019938,
      longitude: 127.68190183476564,
      user_id:1
    },
    {
      address: "福岡",
      content: "目に悪い",
      detail: "美人多すぎてよそ見した",
      latitude: 33.59314254218255,
      longitude: 130.4078964897461,
      user_id:1
    },
    {
      address: "千葉",
      content: "周りみろ",
      detail: "ディズニーで人多すぎてぶつかった",
      latitude: 35.60830678693823,
      longitude: 140.10840723964844,
      user_id:1
    },
    {
      address: "愛知",
      content: "意識とぶ",
      detail: "空気がうますぎて意識保てん",
      latitude: 35.18145060000001,
      longitude: 136.9065571,
      user_id:1
    }
  ]
)