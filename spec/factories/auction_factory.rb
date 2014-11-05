FactoryGirl.define do
  factory :auction do |f|
    f.title "a hat"
    f.description "a hat made from a cat"
    f.end_date 2.days.from_now
    f.category "fashion"
    f.association :user, factory: :user
  end
end