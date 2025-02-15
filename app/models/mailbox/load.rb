# frozen_string_literal: true

# == Schema Information
#
# Table name: mailbox_loads
#
#  id         :bigint           not null, primary key
#  city       :string
#  country    :string
#  ip_address :string
#  timestamp  :decimal(18, 6)
#  user_agent :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  message_id :integer
#
# Indexes
#
#  index_mailbox_loads_on_message_id  (message_id)
#
module Mailbox
  class Load < ApplicationRecord
  end
end
