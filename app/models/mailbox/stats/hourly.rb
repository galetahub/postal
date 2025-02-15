# frozen_string_literal: true

# == Schema Information
#
# Table name: mailbox_stats_hourly
#
#  id         :bigint           not null, primary key
#  bounces    :bigint
#  held       :bigint
#  incoming   :bigint
#  outgoing   :bigint
#  spam       :bigint
#  time       :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_mailbox_stats_hourly_on_time  (time) UNIQUE
#
module Mailbox
  module Stats
    class Hourly < ApplicationRecord

      self.table_name = "mailbox_stats_hourly"

    end
  end
end
