# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :solution do
    feature "MyString"
    description "MyString"
    idea_id 1
  end
end
