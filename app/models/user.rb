class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reports, dependent: :destroy
  has_many :recipes

  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates :age, presence: true
  # validates :gender, presence: true
  validates :email, presence: true
  validates :password, presence: true
  # validates :password_confirmation

  #Validations to consider? - Jules
  # validates :username, uniqueness: true
  # validates :reset_password_token
  # validates: reset_password_sent_at


end
