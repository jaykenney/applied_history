FactoryBot.define do
  factory :contact do
    association(:position)
    name 'Contact'
  end
end
