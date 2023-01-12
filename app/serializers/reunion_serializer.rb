class ReunionSerializer < ActiveModel::Serializer
  attributes :id, :dateReunion, :heureDebut, :heureFin, :ouverte, :commentaire
  has_one :categorie_reunion
end