FactoryBot.define do
  factory :dangerous_spot do
    id { 1 }
    address { '東京都' }
    content { '暗すぎ' }
    detail { '暗くて人とぶつかりそうになった' }
    latitude { '35.6803997' } 
    longitude { '139.7690174' }
    user_id {1}
  end
end