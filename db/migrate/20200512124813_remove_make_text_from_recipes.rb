class RemoveMakeTextFromRecipes < ActiveRecord::Migration[5.2]
  def change
    remove_column :recipes, :make_text, :text
  end
end
