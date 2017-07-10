class Session < ApplicationRecord
  def self.getSession(id_eje)
    return Session.find(id_eje).nombre
  end
  def self.getSessionAlias(id_eje)
    if Session.find(id_eje).id==1
      return 'DST'
    elsif  Session.find(id_eje).id==2
      return 'EDS'
    elsif  Session.find(id_eje).id==3
      return 'MRS'
    elsif  Session.find(id_eje).id==4
      return 'DIC'
    else
      return 'OTRA'
    end
  end
end
