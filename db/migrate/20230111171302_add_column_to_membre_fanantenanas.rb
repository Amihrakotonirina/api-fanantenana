class AddColumnToMembreFanantenanas < ActiveRecord::Migration[6.1]
  def change
    add_column :membre_fanantenanas, :compte_facebook, :string
    add_column :membre_fanantenanas, :don, :string, limit: 50
    add_column :membre_fanantenanas, :etude, :string
    add_column :membre_fanantenanas, :annee_adhesion, :integer
    add_column :membre_fanantenanas, :numero_fpvm, :integer
    add_column :membre_fanantenanas, :status_fpvm, :string, limit: 30
    add_column :membre_fanantenanas, :membre_actif, :boolean, default: true
  end
end