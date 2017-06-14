class Presentation < ApplicationRecord
  belongs_to :session
  has_attached_file :resumen, url: "/presentaciones/:id/resumen.doc"
  has_attached_file :trabajo, url: "/presentaciones/:id/trabajo.doc"
  validates_attachment_content_type :resumen, :content_type => [ 'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document' ]
  validates_attachment_content_type :trabajo, :content_type => [ 'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document' ]
end
