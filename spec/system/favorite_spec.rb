require 'rails_helper'
RSpec.describe 'お気に入りテスト', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @second_user = FactoryBot.create(:second_user)
    @post = FactoryBot.create(:dangerous_spot, user_id: @user.id)
    visit new_user_session_path
    fill_in 'user[email]', with: 'kaiueo@example.com'
    fill_in 'user[password]', with: '111111'
    click_on 'ログイン'
  end
  describe 'お気に入りボタン' do
    context '店舗詳細にお気に入りボタンが表示される' do
      it 'お気に入りする' do
        click_on "投稿一覧画面"
        visit  dangerous_spots_path
        click_on "詳細"
        visit dangerous_spot_path(@user.id)
        click_on "お気に入りする"
        expect(page).to have_content "お気に入り解除する"
      end
    end
    context '店舗詳細にお気に入りボタンが表示される' do
      it 'お気に入りする' do
        click_on "投稿一覧画面"
        visit  dangerous_spots_path
        click_on "詳細"
        visit dangerous_spot_path(@user.id)
        click_on "お気に入りする"
        click_on "お気に入り解除する"
        expect(page).to have_content "お気に入りする"
      end
    end
  end
end