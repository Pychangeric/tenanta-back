class Residence < ApplicationRecord
  before_create :generate_house_code
  self.inheritance_column = :_type_disabled
  #has_many :residence_photos, dependent: :destroy
  #accepts_nested_attributes_for :residence_photos
  has_one_attached :user_agreement_file
  #has_many_attached :photos



  # Commenting out the photos validation temporarily
  # validates :photos, length: { minimum: 10, message: 'must have at least 10 photos' }

  geocoded_by :location do |residence, results|
    if geo = results.first
      residence.latitude = geo.latitude
      residence.longitude = geo.longitude
    end
    geocoded_by :location
    after_validation :geocode
  end
  
  after_validation :geocode, if: ->(residence){ residence.location.present? && residence.location_changed? }

  private

  def generate_house_code
    self.house_code = '#' + rand.to_s[2..6]
  end
end
