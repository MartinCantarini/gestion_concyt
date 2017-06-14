  class User < ApplicationRecord
  validates :tipo_dni,:dni,:nombre,:apellido,:email,presence: true
  validates :dni, uniqueness: true
  belongs_to :poster, optional: true
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :trackable, :validatable
  #devise :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable, :trackable, :validatable
  self.per_page = 15
end
