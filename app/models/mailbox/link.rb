# frozen_string_literal: true

# == Schema Information
#
# Table name: mailbox_links
#
#  id         :bigint           not null, primary key
#  hash       :string
#  timestamp  :decimal(18, 6)
#  token      :string
#  url        :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  message_id :integer
#
# Indexes
#
#  index_mailbox_links_on_message_id  (message_id)
#  index_mailbox_links_on_token       (token)
#
module Mailbox
  class Link < ApplicationRecord
  end
end
