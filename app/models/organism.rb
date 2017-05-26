class Organism < ApplicationRecord
  def self.getOrganismo(id_organismo)
    return Organism.find(id_organismo).nombre
  end
end
