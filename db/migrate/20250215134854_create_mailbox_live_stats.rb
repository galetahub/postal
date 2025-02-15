# frozen_string_literal: true

class CreateMailboxLiveStats < ActiveRecord::Migration[7.0]

  def change
    create_table :mailbox_live_stats do |t|
      t.string :counter_type, limit: 20, null: false
      t.integer :minute, null: false
      t.integer :count
      t.decimal :timestamp, precision: 18, scale: 6

      t.timestamps
    end

    add_index :mailbox_live_stats, [:minute, :counter_type], unique: true
  end

end
