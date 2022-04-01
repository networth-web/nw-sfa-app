FactoryBot.define do
  factory :source do
    name {'ソース名'}
    description {'説明'}
    approval {true}
    association :user
  end
end