class Scholarship < ApplicationRecord
  def self.getBeca(id_beca)
    return Scholarship.find(id_beca).nombre
  end
end
