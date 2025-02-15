# frozen_string_literal: true

class CreateMailboxRawMessageSizes < ActiveRecord::Migration[7.0]

  def change
    create_table :mailbox_raw_message_sizes do |t|
      t.string :table_name
      t.bigint :size

      t.timestamps
    end

    add_index :mailbox_raw_message_sizes, :table_name
  end

end
