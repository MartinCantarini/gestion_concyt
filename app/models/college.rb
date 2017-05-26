class College < ApplicationRecord
  def self.getUniversidad(id_universidad)
    return College.find(id_universidad).nombre
  end
end
