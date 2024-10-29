class SeasonTeam < ApplicationRecord
  belongs_to :season
  belongs_to :team
  has_many :teammates, dependent: :destroy
  has_many :players, through: :teammates
end
