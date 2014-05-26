class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :owner_email
      t.string :name
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
    add_index :channels, :owner_email
    add_index :channels, :name, unique: true
    add_index :channels, :longitude
    add_index :channels, :latitude
  end
end
