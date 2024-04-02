class Residence < ApplicationRecord
    before_create :generate_house_code
    self.inheritance_column = :_type_disabled


    private
  
    def generate_house_code
      self.house_code = '#' + rand.to_s[2..6]
    end
end

