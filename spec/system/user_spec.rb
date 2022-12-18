require 'rails_helper'
RSpec.describe 'ユーザ登録・ログイン・ログアウト機能・管理画面テスト', type: :system do
  describe 'ユーザ登録のテスト' do
    context 'ユーザ登録がなくログインしていない場合' do
      it 'ユーザ新規登録のテスト' do
        visit new_user_registration_path
        fill_in 'user[name]', with: 'aiueo'
        fill_in 'user[email]', with: 'aiu@gmail.com'
        fill_in 'user[password]', with: '1234567'
        fill_in 'user[password_confirmation]', with: '1234567'
        click_on 'アカウント登録'
        expect(page).to have_content 'aiueo'
      end
      it '​ログインしていない時はログイン画面に飛ぶテスト​' do
        visit dangerous_spots_path
        expect(current_path).to eq new_user_session_path
      end
    end
  end

  describe 'session機能テスト' do
    before do
      @user = FactoryBot.create(:user)
      @second_user = FactoryBot.create(:second_user)
      visit new_user_session_path
      fill_in 'user[email]', with: 'kaiueo@example.com'
      fill_in 'user[password]', with: '111111'
      click_on 'ログイン'
    end
    context "ログイン状態でユーザデータがある場合" do
      it '自分の詳細画面に飛べること' do
        expect(page).to have_content 'ページ'
      end
      it '投稿一覧画面に遷移する' do
        click_on "投稿一覧画面"
        visit dangerous_spots_path
        expect(page).to have_content '危険地点一覧'
      end
    end
    context 'ログアウトした場合' do
      it "ログイン画面に戻る" do
        click_on "Log out"
        expect(page).to have_content "ログアウトしました"
      end
    end
  end
end