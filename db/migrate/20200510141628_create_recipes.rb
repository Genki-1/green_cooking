class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.text :make_text
      t.string :ingredient
      t.string :quantity
      t.text :point
      t.string :main_image_id
      t.string :image_id
      t.boolean :is_meat_status, default: false, null: false
      t.boolean :is_fish_status, default: false, null: false
      t.boolean :is_egg_status, default: false, null: false
      t.boolean :is_dairy_products_status, default: false, null: false

      t.timestamps
    end
  end
end
