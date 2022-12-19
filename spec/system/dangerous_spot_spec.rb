require 'rails_helper'
RSpec.describe '投稿', type: :system do
  describe '新規作成のテスト' do
    before do
      @user = FactoryBot.create(:user)
      @second_user = FactoryBot.create(:second_user)
      visit new_user_session_path
      fill_in 'user[email]', with: 'kaiueo@example.com'
      fill_in 'user[password]', with: '111111'
      click_on 'ログイン'
    end
    context '新規投稿を押した場合' do
      it '投稿画面に飛ぶ' do
        visit dangerous_spots_path
        click_on '新規投稿'
        expect(page).to have_content '危険地点の新規作成'
      end
    end
  end
end