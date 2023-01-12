class CreateMembreFanantenanas < ActiveRecord::Migration[6.1]
  def change
    create_table :membre_fanantenanas do |t|
      t.string :matricule, limit: 20
      t.string :nom, limit: 255
      t.string :prenom, limit: 255
      t.string :sexe, limit: 10
      t.date :date_naissance
      t.string :adresse, limit: 255
      t.string :telephone, limit: 50
      t.string :photo_profile
      t.string :telephone_parent, limit: 50
      t.integer :niveau_etude
      t.integer :annee_etude
      t.string :profession, limit: 50
      t.date :date_adhesion

      t.timestamps
    end
  end
end
