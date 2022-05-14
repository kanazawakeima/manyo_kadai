FactoryBot.define do
  factory :task do
    title { 'Factoryタイトル1' }
    content { 'Factoryコンテント1' }
    deadline { '2022-12-01' }
    status { '完了' }
    priority { '高' }
  end
  factory :second_task, class: Task do
    title { 'Factoryタイトル2' }
    content { 'Factoryコンテント2' }
    deadline { '2022-12-02' }
    status { '着手中' }
    priority { '低' }
  end
end
