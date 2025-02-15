# frozen_string_literal: true

class CreateMailboxDeliveries < ActiveRecord::Migration[7.0]

  def change
    create_table :mailbox_deliveries do |t|
      t.integer :message_id
      t.string :status, limit: 255
      t.integer :code
      t.string :output, limit: 512
      t.string :details, limit: 512
      t.boolean :sent_with_ssl, default: false
      t.string :log_id, limit: 100
      t.decimal :timestamp, precision: 18, scale: 6
      t.decimal :time, precision: 18, scale: 6

      t.timestamps
    end

    add_index :mailbox_deliveries, :message_id
  end

end
