class AddViewersIntoVideo < ActiveRecord::Migration[6.0]
  def change
  	add_column :videos, :viewers, :integer, default: 0
  end
end
