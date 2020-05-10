FactoryBot.define do
  factory :report do
    recipe_id { 1 }
    user_id { 1 }
    content { "MyText" }
    image_id { "MyString" }
  end
end
