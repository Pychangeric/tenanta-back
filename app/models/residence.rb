class Residence < ApplicationRecord
  before_create :generate_house_code
  self.inheritance_column = :_type_disabled

  has_one_attached :user_agreement_file
  has_many_attached :snapshots

  validates :snapshots, presence: true
  validate :validate_snapshots_format
  validate :validate_snapshots_size
  validate :validate_minimum_snapshots

  private

  def validate_snapshots_format
    snapshots.each do |snapshot|
      unless snapshot.content_type.in?(%w(image/jpeg image/png))
        errors.add(:snapshots, 'must be a PNG or JPEG format')
        break
      end
    end
  end

  def validate_snapshots_size
    snapshots.each do |snapshot|
      if snapshot.byte_size > 5.megabytes
        errors.add(:snapshots, 'each snapshot should not exceed 5MB')
        break
      end
    end
  end

  def validate_minimum_snapshots
    errors.add(:snapshots, 'must include at least 10 snapshots') unless snapshots.length >= 10
  end

  def generate_house_code
    self.house_code = '#' + rand.to_s[2..6]
  end
end