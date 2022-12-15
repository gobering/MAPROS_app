class AddUserRefToDangerousspots < ActiveRecord::Migration[6.1]
  def change
    add_reference :dangerous_spots, :user, foreign_key: true
  end
end
