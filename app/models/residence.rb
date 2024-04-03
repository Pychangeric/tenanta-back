class Residence < ApplicationRecord
    before_create :generate_house_code
    self.inheritance_column = :_type_disabled
    has_many :photos
    accepts_nested_attributes_for :photos
    validates :photos, length: { minimum: 10, message: 'must have at least 10 photos' }



    private
  
    def generate_house_code
      self.house_code = '#' + rand.to_s[2..6]
    end
end

