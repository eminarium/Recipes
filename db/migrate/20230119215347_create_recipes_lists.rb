class CreateRecipesLists < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes_lists do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end

    add_index :recipes_lists, [:recipe_id, :list_id], unique: true
  end
end
