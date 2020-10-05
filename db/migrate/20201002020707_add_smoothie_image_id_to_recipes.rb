class AddSmoothieImageIdToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :smoothie_image_id, :string
  end
end
