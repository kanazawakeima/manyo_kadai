FactoryBot.define do
  factory :task do
    title { 'Factoryタイトル1' }
    content { 'Factoryコンテント1' }
    deadline { '2022-12-01' }
    status { '完了' }
    priority { '高' }

    after(:build) do |task|
      label = create(:label)
      task.task_label << build(:task_label, task: task, label: label)
    end
  end
  factory :second_task, class: Task do
    title { 'Factoryタイトル2' }
    content { 'Factoryコンテント2' }
    deadline { '2022-12-02' }
    status { '着手中' }
    priority { '低' }  
  end
end
