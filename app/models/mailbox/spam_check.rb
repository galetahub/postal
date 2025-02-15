# frozen_string_literal: true

# == Schema Information
#
# Table name: mailbox_spam_checks
#
#  id          :bigint           not null, primary key
#  code        :string
#  description :text
#  score       :decimal(8, 2)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  message_id  :integer
#
# Indexes
#
#  index_mailbox_spam_checks_on_code        (code)
#  index_mailbox_spam_checks_on_message_id  (message_id)
#
module Mailbox
  class SpamCheck < ApplicationRecord
  end
end
