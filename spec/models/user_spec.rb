require 'rails_helper'
describe 'ユーザーモデル機能', type: :model do
  context 'ユーザー名を作成' do
    it 'バリデーションにひっかからない' do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end
  end
  context 'ユーザー名が空' do
    it 'バリデーションにひっかかる' do
      user = FactoryBot.build(:user, name: nil)
      expect(user).not_to be_valid
    end
  end
  context 'パスワードが無効な形式' do
    it 'バリデーションにひっかかる' do
      user = FactoryBot.build(:user, email: 'aaa')
      expect(user).not_to be_valid
    end
  end
  context 'パスワードが空' do
    it 'バリデーションにひっかかる' do
      user = FactoryBot.build(:user,  password: nil)
      expect(user).not_to be_valid
    end
  end
end
