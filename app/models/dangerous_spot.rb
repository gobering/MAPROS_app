class DangerousSpot < ApplicationRecord
  has_many :labellings, dependent: :destroy
  has_many :labels, through: :labellings
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  belongs_to :user
  validates :address, presence: true
  validates :content, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :detail, presence: true
end