class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string :name, null: false, index: true
      t.string :url, null: false, index: true

      t.timestamps
    end
  end
end
