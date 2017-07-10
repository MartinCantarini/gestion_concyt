  class User < ApplicationRecord
  validates :tipo_dni,:dni,:nombre,:apellido,:email,presence: true
  validates :dni, uniqueness: true
  belongs_to :poster, optional: true
  # devise :database_authenticatable, :registerable,:recoverable, :rememberable, :trackable, :validatable
  devise :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable, :trackable, :validatable
  self.per_page = 15
  #Recibe ID de presentación y retorna si el usaurio autor es becario o no
  def self.esBecario(id_presentacion)
    user=User.where('presentation_id = ?',id_presentacion).first
    if user.tipo_participacion==2
      return "Si"
    else
      return "No"
    end
  end
  #Recibe ID de presentación y retorna nombre y apellido del autor
  def self.getNombreApellidoPresentacion(id_presentacion)
    user=User.where('presentation_id = ?',id_presentacion).first
    return user.nombre+' '+user.apellido
  end
  #Recibe ID de presentación y retorna id del autor
  def self.getId(id_presentacion)
    user=User.where('presentation_id = ?',id_presentacion).first
    return user.id
  end
end
