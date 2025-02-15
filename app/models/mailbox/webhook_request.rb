# frozen_string_literal: true

# == Schema Information
#
# Table name: mailbox_webhook_requests
#
#  id          :bigint           not null, primary key
#  attempt     :integer
#  body        :text
#  event       :string
#  payload     :text
#  status_code :integer
#  timestamp   :decimal(18, 6)
#  url         :text
#  uuid        :string
#  will_retry  :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  webhook_id  :integer
#
# Indexes
#
#  index_mailbox_webhook_requests_on_event       (event)
#  index_mailbox_webhook_requests_on_timestamp   (timestamp)
#  index_mailbox_webhook_requests_on_uuid        (uuid)
#  index_mailbox_webhook_requests_on_webhook_id  (webhook_id)
#
module Mailbox
  class WebhookRequest < ApplicationRecord
  end
end
