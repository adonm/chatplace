class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.integer :user_id
      t.string :name
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
