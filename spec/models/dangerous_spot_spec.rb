require 'rails_helper'
describe '投稿機能', type: :model do
  context 'を作成' do
    it '作成した内容が正しく反映される' do
      post = FactoryBot.build(:dangerous_spot)
      expect(post).to be_valid
    end
  end
  context '地域の入力が空' do
    it 'バリデーションにひっかかる' do
      post = FactoryBot.build(:dangerous_spot, address: nil )
      expect(post).not_to be_valid
    end
  end
  context '愚痴の入力が空' do
    it 'バリデーションにひっかかる' do
      post = FactoryBot.build(:dangerous_spot, content: nil )
      expect(post).not_to be_valid
    end
  end
  context '詳細の入力が空' do
    it 'バリデーションにひっかかる' do
      post = FactoryBot.build(:dangerous_spot, detail: nil )
      expect(post).not_to be_valid
    end
  end
  context 'Google Mapでピンの入力が空' do
    it 'バリデーションにひっかかる' do
      post = FactoryBot.build(:dangerous_spot, latitude: nil, latitude: nil )
      expect(post).not_to be_valid
    end
  end
end