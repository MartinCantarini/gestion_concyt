class Participation < ApplicationRecord
  def self.getParticipacion(id_participacion)
    return Participation.find(id_participacion).nombre
  end
end
