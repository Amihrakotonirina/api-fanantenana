class Reunion < ApplicationRecord
	belongs_to :categorie_reunion
	has_many :presences
end
