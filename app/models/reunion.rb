class Reunion < ApplicationRecord
	belongs_to :categorie_reunion
	has_many :presences

	scope :today, -> { where(dateReunion: Date.today) }
end
