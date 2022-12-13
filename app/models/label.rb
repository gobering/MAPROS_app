class Label < ApplicationRecord
  has_many :labellings, dependent: :destroy
  has_many :dangerous_spots, through: :labellings
end
