class AddNumberOfPeopleToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :number_of_people, :string
  end
end
