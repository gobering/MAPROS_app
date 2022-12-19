class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :dangerous_spot
  validates_uniqueness_of :dangerous_spot_id, scope: :user_id 
end
