class Team < ApplicationRecord
  belongs_to :user
  belongs_to :team_level
  has_many :games, dependent: :destroy
  has_many :season_teams, dependent: :destroy
  has_many :seasons, through: :season_teams
  has_many :plays, dependent: :nullify

  validates :locale, presence: true
  validates :nickname, presence: true
  validates :abbreviation, presence: true

  def name
    "#{locale} #{nickname}"
  end
end
