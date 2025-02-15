# frozen_string_literal: true

class CreateMailboxSpamChecks < ActiveRecord::Migration[7.0]

  def change
    create_table :mailbox_spam_checks do |t|
      t.integer :message_id
      t.decimal :score, precision: 8, scale: 2
      t.string :code
      t.text :description

      t.timestamps
    end

    add_index :mailbox_spam_checks, :message_id
    add_index :mailbox_spam_checks, :code
  end

end
