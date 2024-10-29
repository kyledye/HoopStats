class Teammate < ApplicationRecord
  belongs_to :season_team
  belongs_to :player

  validates :jersey_number, numericality: { only_integer: true }
end
