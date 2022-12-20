class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :dangerous_spot
end
