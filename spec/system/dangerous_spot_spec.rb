require 'rails_helper'
RSpec.describe '投稿', type: :system do
  describe '新規作成のテスト' do
    before do
      @user = FactoryBot.create(:user)
      @post = FactoryBot.create(:dangerous_spot, user_id: @user.id)
      @label = FactoryBot.create(:label)
      visit new_user_session_path
      fill_in 'user[email]', with: 'aiueo@example.com'
      fill_in 'user[password]', with: '123456'
      click_on 'ログイン'
    end
    context '新規投稿を押した場合' do
      it '投稿画面に飛ぶ' do
        visit dangerous_spots_path
        click_on '新規投稿'
        expect(page).to have_content '危険地点の新規作成'
      end
    end
    context '編集する場合' do
      it '編集がうまく行われる' do
        visit dangerous_spots_path
        click_link '編集'
        visit edit_dangerous_spot_path(1)
        click_button '更新する'
        expect(page).to have_content '編集完了！'
      end
    end
    context '削除する場合' do
      it '削除がうまく行われる' do
        visit dangerous_spots_path
        click_link '削除'
        page.accept_confirm '本当に削除しますか?'
        expect(page).to have_content '削除完了'
      end
    end
  end
end