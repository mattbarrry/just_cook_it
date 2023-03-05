class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.references :user, null: false, foreign_key: true
      t.string :url
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end