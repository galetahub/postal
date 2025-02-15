# frozen_string_literal: true

class CreateMailboxLinks < ActiveRecord::Migration[7.0]

  def change
    create_table :mailbox_links do |t|
      t.integer :message_id
      t.string :token
      t.string :hash
      t.text :url
      t.decimal :timestamp, precision: 18, scale: 6

      t.timestamps
    end

    add_index :mailbox_links, :message_id
    add_index :mailbox_links, :token
  end

end
