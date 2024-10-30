class Player < ApplicationRecord
  belongs_to :user
  has_many :teammates, dependent: :destroy
  has_many :season_teams, through: :teammates
  has_many :plays, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true

  default_scope { order(last_name: :asc, first_name: :asc) }
end
