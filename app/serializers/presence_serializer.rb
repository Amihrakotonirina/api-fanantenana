class PresenceSerializer < ActiveModel::Serializer
  attributes :id, :present, :retard, :heureEntree, :heureSortie, :note
  has_one :reunion
  has_one :membre_fanantenana
end