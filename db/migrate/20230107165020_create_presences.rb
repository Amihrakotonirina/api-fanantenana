class CreatePresences < ActiveRecord::Migration[6.1]
  def change
    create_table :presences do |t|
      t.boolean :present
      t.boolean :retard
      t.time :heureEntree
      t.time :heureSortie
      t.text :note
      #t.references :membre, foreign_key: true, index: true
      #t.references :reunion, foreign_key: true, index: true

      t.timestamps
    end
  end
end
