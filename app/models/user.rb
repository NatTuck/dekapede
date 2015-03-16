require 'securerandom'

class User < ActiveRecord::Base
  has_many :characters

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save do
    if self.token.blank?
      self.token = SecureRandom.hex
    end
  end

  def primary_character
    characters.first
  end
end
