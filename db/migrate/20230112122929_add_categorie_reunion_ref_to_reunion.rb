class AddCategorieReunionRefToReunion < ActiveRecord::Migration[6.1]
  def change
    add_reference :reunions, :categorie_reunion, null: true, foreign_key: true
  end
end
