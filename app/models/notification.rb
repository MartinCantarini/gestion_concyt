class Notification < ApplicationRecord
  belongs_to :presentation
  self.per_page = 12
  def self.getCantSinLeeer()
    return Notification.where('leido = 0').count
  end
end
