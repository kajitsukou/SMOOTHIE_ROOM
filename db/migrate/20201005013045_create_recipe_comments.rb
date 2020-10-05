class CreateRecipeComments < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_comments do |t|
      t.string :comment
      t.integer :user_id
      t.integer :recipe_id

      t.timestamps
    end
  end
end
