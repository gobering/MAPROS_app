require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  before do
    user = FactoryBot.create(:user)
    post = FactoryBot.create(:dangerous_spot)
    @label = FactoryBot.create(:label)
    visit new_user_session_path
    fill_in 'user[email]', with: 'aiueo@example.com'
    fill_in 'user[password]', with: '123456'
    click_on 'ログイン'
  end

  describe 'ラベル管理' do
    context 'ラベルを作成' do
      it "ラベルが作成できる" do
        visit new_label_path
        fill_in 'label[name]', with: '車'
        click_on '登録する'
        expect(page).to have_content '車'
      end
    end
  end
end