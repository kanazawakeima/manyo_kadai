require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  let!(:task) { FactoryBot.create(:task, title: 'task') }
  before do
    # あらかじめタスク一覧のテストで使用するためのタスクを二つ作成する
    FactoryBot.create(:task)
    FactoryBot.create(:second_task)
  end
  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        visit new_task_path
        fill_in'task[title]',with: '金澤'
        fill_in'task[content]',with: '金澤'
        fill_in'task[deadline]',with: '002022-01-01'
        click_on '登録する'
      expect(page).to have_content'金澤'
      end
    end
  end
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        task = FactoryBot.create(:task, title: 'task', content: 'task')
        visit tasks_path
        current_path
        Task.count
        page.html
        expect(page).to have_content 'task'
      end
    end
    context 'タスクが作成日時の降順に並んでいる場合' do
      it '新しいタスクが一番上に表示される' do
        task = FactoryBot.create(:task, title: 'task3', content: 'task3')
        task = FactoryBot.create(:task, title: 'task2', content: 'task2')
        visit tasks_path
        click_on '作成順'
        task_list = all('.task_row')
        expect(task_list[0]).to have_content "task2"
        expect(task_list[1]).to have_content "task3"
      end
    end
    context '終了期限が降順に並んでいる場合' do
      it '終了期限が近いタスクが一番上に表示される' do
        task = FactoryBot.create(:task, title: 'task3', content: 'task3', deadline: "2022-08-01")
        task = FactoryBot.create(:task, title: 'task1', content: 'task1', deadline: "2022-06-01")
        task = FactoryBot.create(:task, title: 'task2', content: 'task2', deadline: "2022-07-01")
        visit tasks_path
        click_on '終了期限順'
        task_list = all('.task_row')
        expect(task_list[0]).to have_content "task1"
        expect(task_list[1]).to have_content "task2"
      end
    end
  end
  describe '詳細表示機能' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示される' do
         @task = FactoryBot.create(:task, title: '成功', content: '成功')
         visit task_path(@task.id)
         expect(page).to have_content '成功'
       end
     end
  end
end
