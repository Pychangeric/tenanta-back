class Leader < ApplicationRecord
  # Include default Devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validation example
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true, uniqueness: true
  validates :national_id, presence: true, uniqueness: true
  validates :gender, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
