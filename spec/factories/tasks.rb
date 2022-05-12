FactoryBot.define do
  factory :task do
    title { 'Factoryタイトル１' }
    content { 'Factoryコンテント１' }
  end
  factory :second_task, class: Task do
    title { 'Factoryタイトル２' }
    content { 'Factoryコンテント２' }
  end
end
