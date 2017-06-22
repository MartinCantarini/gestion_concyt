class Exposition < ApplicationRecord
  def self.getNombre(id_exposicion)
    return Exposition.find(id_exposicion).nombre
  end
end
