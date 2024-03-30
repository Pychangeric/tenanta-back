class User < ApplicationRecord
  has_many :payments


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :Trackable,
        :omniauthable, omniauth_providers: [:twitter, :facebook]

  attr_accessor :login


  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(email) = :value OR phone_number = :value", { value: login.downcase }]).first
    elsif conditions.key?(:email) || conditions.key?(:phone_number)
      where(conditions.to_h).first
    end
  end

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone_number, presence: true
end