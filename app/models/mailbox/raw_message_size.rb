# frozen_string_literal: true

# == Schema Information
#
# Table name: mailbox_raw_message_sizes
#
#  id         :bigint           not null, primary key
#  size       :bigint
#  table_name :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_mailbox_raw_message_sizes_on_table_name  (table_name)
#
module Mailbox
  class RawMessageSize < ApplicationRecord
  end
end
