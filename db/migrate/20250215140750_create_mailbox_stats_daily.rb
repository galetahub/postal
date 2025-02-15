# frozen_string_literal: true

class CreateMailboxStatsDaily < ActiveRecord::Migration[7.0]

  def change
    create_table :mailbox_stats_daily do |t|
      t.integer :time, null: false
      t.bigint :incoming
      t.bigint :outgoing
      t.bigint :spam
      t.bigint :bounces
      t.bigint :held

      t.timestamps
    end

    add_index :mailbox_stats_daily, :time, unique: true
  end

end
