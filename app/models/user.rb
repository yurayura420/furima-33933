class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])\w+\z/ 
  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  NAME_READ_REGEX = /\A[ァ-ヶー－]+\z/
  validates :nickname, presence: true
  validates_format_of :password, with: PASSWORD_REGEX
  validates_format_of :first_name, presence: true, with: NAME_REGEX
  validates_format_of :last_name, presence: true, with: NAME_REGEX
  validates_format_of :first_name_read, presence: true, with: NAME_READ_REGEX
  validates_format_of :last_name_read, presence: true, with: NAME_READ_REGEX
  validates :birth_date, presence: true

         
end
