# frozen_string_literal: true

class CreateMailboxSuppressions < ActiveRecord::Migration[7.0]

  def change
    create_table :mailbox_suppressions do |t|
      t.string :suppression_type
      t.string :address
      t.string :reason
      t.decimal :timestamp, precision: 18, scale: 6
      t.decimal :keep_until, precision: 18, scale: 6

      t.timestamps
    end

    add_index :mailbox_suppressions, :address
    add_index :mailbox_suppressions, :keep_until
  end

end
