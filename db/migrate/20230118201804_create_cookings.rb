class CreateCookings < ActiveRecord::Migration[7.0]
  def change
    create_table :cookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end

    add_index :cookings, [:user_id, :recipe_id], unique: true
  end
end
