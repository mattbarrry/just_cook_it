class CreateRecipesSteps < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_steps do |t|
      t.references :recipe_sections, null: false, foreign_key: true
      t.text :instruction

      t.timestamps
    end
  end
end
