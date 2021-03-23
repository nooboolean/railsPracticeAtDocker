FactoryBot.define do
  factory :user, class: User do
    name {'テストユーザー'}
    email {'test01@example.com'}
    password {'password'}
  end
end