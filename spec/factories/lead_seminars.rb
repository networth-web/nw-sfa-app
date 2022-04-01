FactoryBot.define do
  factory :lead_seminar do
    attend_id                 {1}
    approval_id               {1}
    association :lead
  end
end
