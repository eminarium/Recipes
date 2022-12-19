class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :brief_info
      t.text :description
      t.integer :likes, null: false, default: 0
      t.integer :dislikes, null: false, default: 0
      t.boolean :is_halal, null: false, default: false
      t.boolean :is_kosher, null: false, default: false
      t.boolean :is_vegetarian, null: false, default: false

      t.timestamps
    end
  end
end
