class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.integer :recipe_id
      t.integer :user_id
      t.text :content
      t.string :image_id

      t.timestamps
    end
  end
end
