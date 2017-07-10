class Center < ApplicationRecord
  def self.getNombre(id_centro)
    return Center.find(id_centro).nombre
  end
  def self.getSiglas(id_centro)
    return Center.find(id_centro).siglas
  end
end
