# frozen_string_literal: true

# == Schema Information
#
# Table name: mailbox_messages
#
#  id                    :bigint           not null, primary key
#  bounce                :boolean          default(FALSE)
#  clicked               :decimal(18, 6)
#  endpoint_type         :string
#  held                  :boolean          default(FALSE)
#  hold_expiry           :decimal(18, 6)
#  inspected             :boolean          default(FALSE)
#  last_delivery_attempt :decimal(18, 6)
#  loaded                :decimal(18, 6)
#  mail_from             :string
#  parsed                :boolean          default(FALSE)
#  raw_table             :string(255)
#  rcpt_to               :string
#  received_with_ssl     :boolean          default(FALSE)
#  scope                 :string(10)
#  size                  :string(255)
#  spam                  :boolean          default(FALSE)
#  spam_score            :decimal(8, 2)    default(0.0)
#  status                :string(255)
#  subject               :text
#  tag                   :string(255)
#  threat                :boolean          default(FALSE)
#  threat_details        :string(255)
#  timestamp             :decimal(18, 6)
#  token                 :string
#  tracked_images        :integer          default(0)
#  tracked_links         :integer          default(0)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  bounce_for_id         :integer
#  credential_id         :integer
#  domain_id             :integer
#  endpoint_id           :integer
#  message_id            :string(255)
#  raw_body_id           :integer
#  raw_headers_id        :integer
#  route_id              :integer
#
# Indexes
#
#  index_mailbox_messages_on_bounce_for_id                      (bounce_for_id)
#  index_mailbox_messages_on_held                               (held)
#  index_mailbox_messages_on_mail_from                          (mail_from)
#  index_mailbox_messages_on_message_id                         (message_id)
#  index_mailbox_messages_on_raw_table                          (raw_table)
#  index_mailbox_messages_on_rcpt_to                            (rcpt_to)
#  index_mailbox_messages_on_scope_spam_and_timestamp           (scope,spam,timestamp)
#  index_mailbox_messages_on_scope_spam_status_and_timestamp    (scope,spam,status,timestamp)
#  index_mailbox_messages_on_scope_spam_tag_and_timestamp       (scope,spam,tag,timestamp)
#  index_mailbox_messages_on_scope_threat_and_timestamp         (scope,threat,timestamp)
#  index_mailbox_messages_on_scope_threat_status_and_timestamp  (scope,threat,status,timestamp)
#  index_mailbox_messages_on_status                             (status)
#  index_mailbox_messages_on_token                              (token)
#
module Mailbox
  class Message < ApplicationRecord
  end
end
