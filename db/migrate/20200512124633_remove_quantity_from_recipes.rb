class RemoveQuantityFromRecipes < ActiveRecord::Migration[5.2]
  def change
    remove_column :recipes, :quantity, :string
  end
end
