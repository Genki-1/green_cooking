FactoryBot.define do
  factory :recipe do
    user_id { 1 }
    title { "MyString" }
    description { "MyText" }
    make_text { "MyText" }
    ingredient { "MyString" }
    quantity { "MyString" }
    point { "MyText" }
    main_image_id { "MyString" }
    image_id { "MyString" }
    is_meat_status { false }
    is_fish_status { false }
    is_egg_status { false }
    is_dairy_products_status { false }
  end
end
