class Period < ApplicationRecord
  has_many :plays, dependent: :nullify
end
