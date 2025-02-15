# frozen_string_literal: true

class CreateMailboxMessages < ActiveRecord::Migration[7.0]

  def change
    create_table :mailbox_messages do |t|
      t.string :token
      t.string :scope, limit: 10
      t.string :rcpt_to
      t.string :mail_from
      t.text :subject
      t.string :message_id, limit: 255
      t.decimal :timestamp, precision: 18, scale: 6
      t.integer :route_id
      t.integer :domain_id
      t.integer :credential_id
      t.string :status, limit: 255
      t.boolean :held, default: false
      t.string :size, limit: 255
      t.decimal :last_delivery_attempt, precision: 18, scale: 6
      t.string :raw_table, limit: 255
      t.integer :raw_body_id
      t.integer :raw_headers_id
      t.boolean :inspected, default: false
      t.boolean :spam, default: false
      t.decimal :spam_score, precision: 8, scale: 2, default: 0
      t.boolean :threat, default: false
      t.string :threat_details, limit: 255
      t.boolean :bounce, default: false
      t.integer :bounce_for_id
      t.string :tag, limit: 255
      t.decimal :loaded, precision: 18, scale: 6
      t.decimal :clicked, precision: 18, scale: 6
      t.boolean :received_with_ssl, default: false
      t.decimal :hold_expiry, precision: 18, scale: 6
      t.integer :tracked_links, default: 0
      t.integer :tracked_images, default: 0
      t.boolean :parsed, default: false

      t.integer :endpoint_id
      t.string :endpoint_type

      t.timestamps
    end

    add_index :mailbox_messages, :message_id
    add_index :mailbox_messages, :token
    add_index :mailbox_messages, :bounce_for_id
    add_index :mailbox_messages, :held
    add_index :mailbox_messages, [:scope, :spam, :status, :timestamp], name: "index_mailbox_messages_on_scope_spam_status_and_timestamp"
    add_index :mailbox_messages, [:scope, :spam, :tag, :timestamp], name: "index_mailbox_messages_on_scope_spam_tag_and_timestamp"
    add_index :mailbox_messages, [:scope, :spam, :timestamp], name: "index_mailbox_messages_on_scope_spam_and_timestamp"
    add_index :mailbox_messages, [:scope, :threat, :status, :timestamp], name: "index_mailbox_messages_on_scope_threat_status_and_timestamp"
    add_index :mailbox_messages, [:scope, :threat, :timestamp], name: "index_mailbox_messages_on_scope_threat_and_timestamp"
    add_index :mailbox_messages, :rcpt_to
    add_index :mailbox_messages, :mail_from
    add_index :mailbox_messages, :raw_table
    add_index :mailbox_messages, :status
  end

end
