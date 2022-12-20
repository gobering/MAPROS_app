require 'rails_helper'
describe 'ラベルモデル機能', type: :model do
  context 'ラベルを作成' do
    it '作成した内容が反映される' do
      label = FactoryBot.build(:label)
      expect(label).to be_valid
    end
  end
  context 'ラベル名が空' do
    it 'バリデーションに引っかかる' do
      label = FactoryBot.build(:label, name: nil)
      expect(label).not_to be_valid
    end
  end
end