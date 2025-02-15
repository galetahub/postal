# frozen_string_literal: true

class CreateMailboxWebhookRequests < ActiveRecord::Migration[7.0]

  def change
    create_table :mailbox_webhook_requests do |t|
      t.string :uuid
      t.string :event
      t.text :url
      t.integer :attempt
      t.decimal :timestamp, precision: 18, scale: 6
      t.integer :status_code
      t.text :body
      t.text :payload
      t.boolean :will_retry, default: false
      t.integer :webhook_id
      t.timestamps
    end

    add_index :mailbox_webhook_requests, :uuid
    add_index :mailbox_webhook_requests, :event
    add_index :mailbox_webhook_requests, :timestamp
    add_index :mailbox_webhook_requests, :webhook_id
  end

end
