class Notification < ApplicationRecord
  belongs_to :presentation
  self.per_page = 12
  def self.getCantSinLeeer()
    return Notification.where('para_administrador = 1 AND leido = 0').count
  end
  def self.getTiene(id_presentacion)
    if Notification.where('para_administrador = 0 AND presentation_id = ?',id_presentacion).count > 0
      return true
    else
      return false
    end
  end
end
