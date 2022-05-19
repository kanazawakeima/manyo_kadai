FactoryBot.define do
  factory :admin_user, class: User do
    name { "管理ユーザー" }
    email { "admin@admin.com" }
    password {"admin@admin.com"}
    password_confirmation { "admin@admin.com" }
    admin { true }
  end

  factory :user do
    name { "一般ユーザー" }
    email { "hoge@hoge.com" }
    password {"hoge@hoge.com"}
    password_confirmation { "hoge@hoge.com" }
  end
end
