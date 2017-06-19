class Notification < ApplicationRecord
  belongs_to :presentation
  self.per_page = 12
  def self.getCantSinLeeer()
    return Notification.where('para_administrador = 1 AND leido = 0').count
  end
end
