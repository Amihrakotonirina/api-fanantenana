class MembreFanantenanaSerializer < ActiveModel::Serializer
  attributes :id, :matricule, :nom, :prenom, :sexe, :date_naissance, :adresse,
              :telephone, :photo_profile, :telephone_parent, :niveau_etude, :annee_etude,
              :profession, :date_adhesion, :compte_facebook, :don, :etude, :annee_adhesion,
              :numero_fpvm, :status_fpvm, :membre_actif
end