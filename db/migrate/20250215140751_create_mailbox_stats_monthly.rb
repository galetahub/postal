# frozen_string_literal: true

class CreateMailboxStatsMonthly < ActiveRecord::Migration[7.0]

  def change
    create_table :mailbox_stats_monthly do |t|
      t.integer :time, null: false
      t.bigint :incoming
      t.bigint :outgoing
      t.bigint :spam
      t.bigint :bounces
      t.bigint :held

      t.timestamps
    end

    add_index :mailbox_stats_monthly, :time, unique: true
  end

end
