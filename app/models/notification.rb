class Notification < ApplicationRecord
  belongs_to :presentation
  self.per_page = 12
  def self.getCantSinLeeer(user_id)
    cant=0
    notificaciones=Notification.where('para_administrador = 1 AND leido = 0')
    notificaciones.each do |n|
      if (Presentation.find(n.presentation_id).user_id==user_id)
        cant=cant+1
      end
    end
    return cant
  end
  def self.getTiene(id_presentacion)
    if Notification.where('para_administrador = 0 AND presentation_id = ?',id_presentacion).count > 0
      return true
    else
      return false
    end
  end
  def self.getDateUltimaCorreccion(id_presentacion)
    if Notification.where('para_administrador = 0 AND presentation_id = ?',id_presentacion).count > 0
      Notification.where('para_administrador = 0 AND presentation_id = ?',id_presentacion).last.created_at - 3.hours
    else
      'No disponible'
    end
  end
end
