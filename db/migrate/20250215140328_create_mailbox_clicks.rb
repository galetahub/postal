# frozen_string_literal: true

class CreateMailboxClicks < ActiveRecord::Migration[7.0]

  def change
    create_table :mailbox_clicks do |t|
      t.integer :message_id
      t.integer :link_id
      t.string :ip_address
      t.string :country
      t.string :city
      t.text :user_agent
      t.decimal :timestamp, precision: 18, scale: 6

      t.timestamps
    end

    add_index :mailbox_clicks, :message_id
    add_index :mailbox_clicks, :link_id
  end

end
