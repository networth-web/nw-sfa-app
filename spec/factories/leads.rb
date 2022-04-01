FactoryBot.define do
  factory :lead do
    name        {Faker::Name.initials(number: 2)}
    contact_id  {1}
    association :source
    association :sales_process
    association :owner
  end
end
