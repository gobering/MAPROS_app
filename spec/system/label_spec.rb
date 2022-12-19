require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  before do
    user = FactoryBot.create(:user)
    post = FactoryBot.create(:dangerous_spot)
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
    context '投稿にラベルをつける事ができる' do
      it '新規投稿作成時にラベルをつける事ができる' do
        visit  new_dangerous_spot_path
        fill_in 'dangerous_spot[address]',with: '大阪府'
        fill_in 'dangerous_spot[content]',with: '狭い'
        fill_in 'dangerous_spot[detail]',with: '道狭すぎ'
        fill_in 'dangerous_spot[latitude]',with: '34.6413315'
        fill_in 'dangerous_spot[longitude]',with: '135.5629394'
        check "dangerous_spot_label_ids_#{(@label.id)}"
        click_on '登録する'
        expect(page).to have_content '大阪府'
      end
    end
  end
end