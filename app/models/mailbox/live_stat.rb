# frozen_string_literal: true

# == Schema Information
#
# Table name: mailbox_live_stats
#
#  id           :bigint           not null, primary key
#  count        :integer
#  counter_type :string(20)       not null
#  minute       :integer          not null
#  timestamp    :decimal(18, 6)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_mailbox_live_stats_on_minute_and_counter_type  (minute,counter_type) UNIQUE
#
module Mailbox
  class LiveStat < ApplicationRecord
  end
end
