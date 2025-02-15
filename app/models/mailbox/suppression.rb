# frozen_string_literal: true

# == Schema Information
#
# Table name: mailbox_suppressions
#
#  id               :bigint           not null, primary key
#  address          :string
#  keep_until       :decimal(18, 6)
#  reason           :string
#  suppression_type :string
#  timestamp        :decimal(18, 6)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_mailbox_suppressions_on_address     (address)
#  index_mailbox_suppressions_on_keep_until  (keep_until)
#
module Mailbox
  class Suppression < ApplicationRecord
  end
end
