require 'rails_helper'
describe 'ユーザー管理機能', type: :system do
  before do
    # FactoryBot.create(:admin_user)
    # FactoryBot.create(:user)
  end
  describe 'ユーザ登録のテスト' do
    context 'ユーザの新規登録ができるか' do
      it '作成済みのユーザが表示される' do
        visit new_user_path

        fill_in 'user[name]',with: 'keima'
        fill_in 'user[email]',with: 'keima@keima.com'
        fill_in 'user[password]',with: 'keima@keima.com'
        fill_in 'user[password_confirmation]',with: 'keima@keima.com'
        click_on '登録する'
        expect(page).to have_content'keima@keima.com'
      end
    end
    context '一覧画面に飛ぼうとしたとき、ログイン画面に遷移する' do
      it 'タスクに飛ばしてログインに遷移する' do
        visit tasks_path
        expect(current_path).to eq(new_session_path)
      end
    end
  end

  describe 'セッション機能のテスト' do
    before do
      @admin = FactoryBot.create(:admin_user)
      @user = FactoryBot.create(:user)
      visit new_session_path
      fill_in 'session[email]',with: 'hoge@hoge.com'
      fill_in 'session[password]',with: 'hoge@hoge.com'
      click_on 'Log in'
    end
    context 'ログインができること' do
      it 'ログイン可能か' do
        expect(page).to have_content'hoge@hoge.com'
      end
      it '他人の画面に行かせない' do
        visit user_path(@admin.id)
        expect(current_path).to eq(tasks_path)
      end
    end
    context 'ログアウトができること' do
      it 'ログアウト可能か' do
        visit user_path(@user.id)
        click_on 'Logout'
        expect(current_path).to eq(new_session_path)
      end
    end
  end
  describe '管理画面のテスト' do
    before do
      @admin = FactoryBot.create(:admin_user)
      @user = FactoryBot.create(:user)
      visit new_session_path
      fill_in 'session[email]',with: 'admin@admin.com'
      fill_in 'session[password]',with: 'admin@admin.com'
      click_on 'Log in'
    end
    context '管理ユーザはアクセスができること' do
      it 'アクセス可能か' do
        visit admin_users_path
        expect(current_path).to eq(admin_users_path)
      end
      it 'ユーザの新規登録ができるか' do
        click_on '管理者画面'
        click_on '新規ユーザーを作成する'
        fill_in 'user[name]',with: 'fuga'
        fill_in 'user[email]',with: 'fuga@fuga.com'
        fill_in 'user[password]',with: 'fuga@fuga.com'
        fill_in 'user[password_confirmation]',with: 'fuga@fuga.com'
        click_on '登録する'
        expect(page).to have_content'fuga'
      end
      it 'ユーザの詳細画面にアクセスできるか' do
        visit admin_users_path
        all('tbody tr')[1].click_link '詳細'
        expect(page).to have_content'のタスク一覧ページ'
      end
      it 'ユーザの編集画面からユーザを編集できるか' do
        visit admin_users_path
        all('tbody tr')[1].click_link '編集'
        fill_in 'user[name]',with: 'hogehoge'
        fill_in 'user[email]',with: 'hoge@hoge.com'
        fill_in 'user[password]',with: 'hoge@hoge.com'
        fill_in 'user[password_confirmation]',with: 'hoge@hoge.com'
        check 'user[admin]'
        click_on '登録する'
        expect(page).to have_content'hogehoge'
      end
      it 'ユーザの削除をできるか' do
        visit admin_users_path
        all('tbody tr')[1].click_link '削除'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content'ユーザーを削除しました'
      end
    end
    context '一般ユーザはアクセスができないこと' do
      it '一般ユーザはタスク一覧に飛ばす' do
        click_on 'Logout'
        fill_in 'session[email]',with: 'hoge@hoge.com'
        fill_in 'session[password]',with: 'hoge@hoge.com'
        click_on 'Log in'
        click_on '管理者画面'
        expect(page).to have_content'管理者以外はアクセスできません'
      end
    end
  end
end
