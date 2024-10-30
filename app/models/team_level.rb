class TeamLevel < ApplicationRecord
  has_many :teams

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :abbreviation, presence: true, uniqueness: { case_sensitive: false }
end
