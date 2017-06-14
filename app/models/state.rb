class State < ApplicationRecord
  def self.getStateNombre(id_estado)
    return State.find(id_estado).nombre
  end
end
