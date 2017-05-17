class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :dni,:nombre,:apellido, :email, :password,:password_confirmation,presence: true
  #validates :email, uniqueness: true
  validates :dni, uniqueness: true
  belongs_to :poster, optional: true
  devise :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable, :trackable, :validatable

  #belongs_to :poster, optional: true
end
