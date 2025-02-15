# frozen_string_literal: true

class CreateMailboxLoads < ActiveRecord::Migration[7.0]

  def change
    create_table :mailbox_loads do |t|
      t.integer :message_id
      t.string :ip_address
      t.string :country
      t.string :city
      t.text :user_agent
      t.decimal :timestamp, precision: 18, scale: 6

      t.timestamps
    end

    add_index :mailbox_loads, :message_id
  end

end
