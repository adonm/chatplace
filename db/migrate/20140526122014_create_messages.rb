class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :email
      t.string :channel
      t.text :body
      t.datetime :time

      t.timestamps
    end
    add_index :messages, :email
    add_index :messages, :channel
  end
end
