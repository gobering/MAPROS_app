class DangerousSpot < ApplicationRecord
  has_many :labellings, dependent: :destroy
  has_many :labels, through: :labellings
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
end
