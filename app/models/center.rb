class Center < ApplicationRecord
  def self.getCentro(id_centro)
    Center.find(id_centro).nombre
  end
end
