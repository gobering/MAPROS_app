class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
    end
  end
  
  def self.guest_admin
    find_or_create_by!(email: 'admin_guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "admin_guest"
      user.admin = true
    end
  end
  validates :name, presence: true
  has_many :favorites, dependent: :destroy
  has_many :dangerous_spots, dependent: :destroy
end
