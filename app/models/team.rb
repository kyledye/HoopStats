class Team < ApplicationRecord
  belongs_to :user
  has_many :games, dependent: :destroy
  has_many :season_teams, dependent: :destroy
  has_many :seasons, through: :season_teams
  has_many :plays, dependent: :nullify

  validates :name, presence: true
end
