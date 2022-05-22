require 'rails_helper'
RSpec.describe 'ラベル管理機能', type: :system do
  before do
    load Rails.root.join("db/seeds.rb")
    FactoryBot.create(:user)
    visit new_task_path
    fill_in'session[email]',with: 'hoge@hoge.com'
    fill_in'session[password]',with: 'hoge@hoge.com'
    click_on 'Log in'
    visit new_task_path
    fill_in'task[title]',with: '金澤'
    fill_in'task[content]',with: '金澤'
    fill_in'task[deadline]',with: '002022-01-01'
    select'完了',from: 'task_status'
    check '仕事'
    click_on '登録する'
  end
  describe '新規作成機能' do
    context 'ラベルを新規作成した場合' do
      it '作成したラベルが表示される' do
      expect(page).to have_content'金澤'
      end
      it '作成したラベルを検索できる' do
        visit tasks_path
        select'仕事'
        click_on 'Search'
        expect(page).to have_content'金澤'
      end
      it '作成したラベルを編集できる' do
        visit tasks_path
        click_on '編集'
        check 'プライベート'
        click_on '更新する'
        expect(page).to have_content'プライベート'
      end
    end
  end
end
