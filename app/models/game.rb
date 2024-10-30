class Game < ApplicationRecord
  belongs_to :season
  belongs_to :team
  belongs_to :opponent, class_name: 'Team'
  has_many :plays, dependent: :destroy

  before_validation :validate_date_time_format

  private

  def validate_date_time_format
    if date_time.present? && !(date_time.is_a?(DateTime) || date_time.is_a?(ActiveSupport::TimeWithZone))
      errors.add(:date_time, "must be a valid DateTime or nil")
      self.date_time = nil # Prevent further issues in DB assignment
    end
  end
end
