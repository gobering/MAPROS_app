class Label < ApplicationRecord
  has_many :labellings, dependent: :destroy
  has_many :dangerous_spots, through: :labellings
  validates :name, presence: true
end
