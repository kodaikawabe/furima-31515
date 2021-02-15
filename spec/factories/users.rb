FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.free_email }
    password              { 'aaa000' }
    password_confirmation { password }
    first_name            { '太郎' }
    family_name           { '山田' }
    first_name_kana       { 'タロウ' }
    family_name_kana      { 'ヤマダ' }
    birthday              { '1995-03-02' }
  end
end
