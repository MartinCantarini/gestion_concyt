class User < ApplicationRecord
  validates :tipo_dni,:dni,:nombre,:apellido,:email,presence: true
  validates :dni, uniqueness: true
  belongs_to :poster, optional: true
  devise :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable, :trackable, :validatable
end
