class Season < ApplicationRecord
  belongs_to :user
  has_many :games, dependent: :destroy
  has_many :season_teams, dependent: :destroy
  has_many :teams, through: :season_teams

  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
