class Session < ApplicationRecord
  def self.getSession(id_eje)
    return Session.find(id_eje).nombre
  end
end
