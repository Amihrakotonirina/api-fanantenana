class AddReunionRefToPresence < ActiveRecord::Migration[6.1]
  def change
    add_reference :presences, :reunion, null: false, foreign_key: true
  end
end
