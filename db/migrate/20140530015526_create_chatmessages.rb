class CreateChatmessages < ActiveRecord::Migration
  def change
    create_table :chatmessages do |t|
      t.integer :user_id
      t.integer :channel_id
      t.text :body
      t.datetime :time

      t.timestamps
    end
  end
end
