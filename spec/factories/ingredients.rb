FactoryBot.define do
  factory :ingredient do
    recipe_id { 1 }
    name { "MyString" }
    quantity { "MyString" }
  end
end
