# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :professor do
    email 'professor@professor.com'
    password 'password'
    department_id 1
  end
end
