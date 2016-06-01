class Employee < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  has_many :adoptions
  has_many :volunteers
  has_many :donations

  validates_presence_of :email, :name, :cc, :contact
end
