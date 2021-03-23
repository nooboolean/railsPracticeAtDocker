FactoryBot.define do
  factory :task do
    name {'テスト'}
    description {'テストテストテスト'}
    association :user, factory: :user
  end
end