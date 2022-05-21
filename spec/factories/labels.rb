FactoryBot.define do
  factory :label do
    name { "仕事" }
  end

  factory :second_label, class: Label do
    name { "家庭" }
  end

  factory :third_label, class: Label do
    name { "プライベート" }
  end
end
