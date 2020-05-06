class CreateRecipe < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :description
      t.string :tips
      t.text :directions

      t.timestamps
    end
  end
end
