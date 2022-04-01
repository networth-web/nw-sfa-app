FactoryBot.define do
  factory :user do
    name                  {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    role                  {'システム管理者'}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end

  factory :owner, class: User do
    name                  {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    role                  {'一般'}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end