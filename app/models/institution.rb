class Institution < ApplicationRecord
  def self.getInstitucion(id_institucion)
    return Institution.find(id_institucion).nombre
  end
end
