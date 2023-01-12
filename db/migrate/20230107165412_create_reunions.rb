class CreateReunions < ActiveRecord::Migration[6.1]
  def change
    create_table :reunions do |t|
      t.date :dateReunion
      t.time :heureDebut
      t.time :heureFin
      #t.references :categorie, foreign_key: true, index: true
      t.boolean :ouverte
      t.text :commentaire

      t.timestamps
    end
  end
end
