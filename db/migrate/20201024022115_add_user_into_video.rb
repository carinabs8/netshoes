class AddUserIntoVideo < ActiveRecord::Migration[6.0]
  def change
  	add_reference :videos, :user, index: true, null: false
  end
end
