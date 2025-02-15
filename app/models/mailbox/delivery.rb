# frozen_string_literal: true

# == Schema Information
#
# Table name: mailbox_deliveries
#
#  id            :bigint           not null, primary key
#  code          :integer
#  details       :string(512)
#  output        :string(512)
#  sent_with_ssl :boolean          default(FALSE)
#  status        :string(255)
#  time          :decimal(18, 6)
#  timestamp     :decimal(18, 6)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  log_id        :string(100)
#  message_id    :integer
#
# Indexes
#
#  index_mailbox_deliveries_on_message_id  (message_id)
#
module Mailbox
  class Delivery < ApplicationRecord
  end
end
