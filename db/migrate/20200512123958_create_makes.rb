class CreateMakes < ActiveRecord::Migration[5.2]
  def change
    create_table :makes do |t|
      t.integer :recipe_id
      t.string :process
      t.string :image_id

      t.timestamps
    end
  end
end
