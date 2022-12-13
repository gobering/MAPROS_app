class Labelling < ApplicationRecord
  belongs_to :dangerous_spot
  belongs_to :label
end
