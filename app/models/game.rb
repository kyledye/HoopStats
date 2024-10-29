class Game < ApplicationRecord
  belongs_to :season
  belongs_to :team
  belongs_to :opponent, class_name: 'Team'
  has_many :plays, dependent: :destroy

  has_many :plays

  validate :valid_date_time_or_nil

  private

  def valid_date_time_or_nil
    if date_time.present? && !date_time.is_a?(DateTime)
      errors.add(:date_time, "must be a valid DateTime or nil")
    end
  end
end
