class CreateCategorieReunions < ActiveRecord::Migration[6.1]
  def change
    create_table :categorie_reunions do |t|
      t.string :categorie
      t.text :description
      t.timestamps
    end
  end
end
