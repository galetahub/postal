# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2025_02_15_142343) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "additional_route_endpoints", id: :serial, force: :cascade do |t|
    t.integer "route_id"
    t.string "endpoint_type"
    t.integer "endpoint_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "address_endpoints", id: :serial, force: :cascade do |t|
    t.integer "server_id"
    t.string "uuid"
    t.string "address"
    t.datetime "last_used_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "authie_sessions", id: :serial, force: :cascade do |t|
    t.string "token"
    t.string "browser_id"
    t.integer "user_id"
    t.boolean "active", default: true
    t.text "data"
    t.datetime "expires_at", precision: nil
    t.datetime "login_at", precision: nil
    t.string "login_ip"
    t.datetime "last_activity_at", precision: nil
    t.string "last_activity_ip"
    t.string "last_activity_path"
    t.string "user_agent"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "user_type"
    t.integer "parent_id"
    t.datetime "two_factored_at", precision: nil
    t.string "two_factored_ip"
    t.integer "requests", default: 0
    t.datetime "password_seen_at", precision: nil
    t.string "token_hash"
    t.string "host"
    t.boolean "skip_two_factor", default: false
    t.string "login_ip_country"
    t.string "two_factored_ip_country"
    t.string "last_activity_ip_country"
    t.index ["browser_id"], name: "index_authie_sessions_on_browser_id"
    t.index ["token"], name: "index_authie_sessions_on_token"
    t.index ["token_hash"], name: "index_authie_sessions_on_token_hash"
    t.index ["user_id"], name: "index_authie_sessions_on_user_id"
  end

  create_table "credentials", id: :serial, force: :cascade do |t|
    t.integer "server_id"
    t.string "key"
    t.string "type"
    t.string "name"
    t.text "options"
    t.datetime "last_used_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "hold", default: false
    t.string "uuid"
  end

  create_table "domains", id: :serial, force: :cascade do |t|
    t.integer "server_id"
    t.string "uuid"
    t.string "name"
    t.string "verification_token"
    t.string "verification_method"
    t.datetime "verified_at", precision: nil
    t.text "dkim_private_key"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "dns_checked_at"
    t.string "spf_status"
    t.string "spf_error"
    t.string "dkim_status"
    t.string "dkim_error"
    t.string "mx_status"
    t.string "mx_error"
    t.string "return_path_status"
    t.string "return_path_error"
    t.boolean "outgoing", default: true
    t.boolean "incoming", default: true
    t.string "owner_type"
    t.integer "owner_id"
    t.string "dkim_identifier_string"
    t.boolean "use_for_any"
    t.index ["server_id"], name: "index_domains_on_server_id"
    t.index ["uuid"], name: "index_domains_on_uuid"
  end

  create_table "http_endpoints", id: :serial, force: :cascade do |t|
    t.integer "server_id"
    t.string "uuid"
    t.string "name"
    t.string "url"
    t.string "encoding"
    t.string "format"
    t.boolean "strip_replies", default: false
    t.text "error"
    t.datetime "disabled_until"
    t.datetime "last_used_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "include_attachments", default: true
    t.integer "timeout"
  end

  create_table "ip_addresses", id: :serial, force: :cascade do |t|
    t.integer "ip_pool_id"
    t.string "ipv4"
    t.string "ipv6"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "hostname"
    t.integer "priority"
  end

  create_table "ip_pool_rules", id: :serial, force: :cascade do |t|
    t.string "uuid"
    t.string "owner_type"
    t.integer "owner_id"
    t.integer "ip_pool_id"
    t.text "from_text"
    t.text "to_text"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "ip_pools", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "uuid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "default", default: false
    t.index ["uuid"], name: "index_ip_pools_on_uuid"
  end

  create_table "mailbox_clicks", force: :cascade do |t|
    t.integer "message_id"
    t.integer "link_id"
    t.string "ip_address"
    t.string "country"
    t.string "city"
    t.text "user_agent"
    t.decimal "timestamp", precision: 18, scale: 6
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_id"], name: "index_mailbox_clicks_on_link_id"
    t.index ["message_id"], name: "index_mailbox_clicks_on_message_id"
  end

  create_table "mailbox_deliveries", force: :cascade do |t|
    t.integer "message_id"
    t.string "status", limit: 255
    t.integer "code"
    t.string "output", limit: 512
    t.string "details", limit: 512
    t.boolean "sent_with_ssl", default: false
    t.string "log_id", limit: 100
    t.decimal "timestamp", precision: 18, scale: 6
    t.decimal "time", precision: 18, scale: 6
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_mailbox_deliveries_on_message_id"
  end

  create_table "mailbox_links", force: :cascade do |t|
    t.integer "message_id"
    t.string "token"
    t.string "hash"
    t.text "url"
    t.decimal "timestamp", precision: 18, scale: 6
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_mailbox_links_on_message_id"
    t.index ["token"], name: "index_mailbox_links_on_token"
  end

  create_table "mailbox_live_stats", force: :cascade do |t|
    t.string "counter_type", limit: 20, null: false
    t.integer "minute", null: false
    t.integer "count"
    t.decimal "timestamp", precision: 18, scale: 6
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["minute", "counter_type"], name: "index_mailbox_live_stats_on_minute_and_counter_type", unique: true
  end

  create_table "mailbox_loads", force: :cascade do |t|
    t.integer "message_id"
    t.string "ip_address"
    t.string "country"
    t.string "city"
    t.text "user_agent"
    t.decimal "timestamp", precision: 18, scale: 6
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_mailbox_loads_on_message_id"
  end

  create_table "mailbox_messages", force: :cascade do |t|
    t.string "token"
    t.string "scope", limit: 10
    t.string "rcpt_to"
    t.string "mail_from"
    t.text "subject"
    t.string "message_id", limit: 255
    t.decimal "timestamp", precision: 18, scale: 6
    t.integer "route_id"
    t.integer "domain_id"
    t.integer "credential_id"
    t.string "status", limit: 255
    t.boolean "held", default: false
    t.string "size", limit: 255
    t.decimal "last_delivery_attempt", precision: 18, scale: 6
    t.string "raw_table", limit: 255
    t.integer "raw_body_id"
    t.integer "raw_headers_id"
    t.boolean "inspected", default: false
    t.boolean "spam", default: false
    t.decimal "spam_score", precision: 8, scale: 2, default: "0.0"
    t.boolean "threat", default: false
    t.string "threat_details", limit: 255
    t.boolean "bounce", default: false
    t.integer "bounce_for_id"
    t.string "tag", limit: 255
    t.decimal "loaded", precision: 18, scale: 6
    t.decimal "clicked", precision: 18, scale: 6
    t.boolean "received_with_ssl", default: false
    t.decimal "hold_expiry", precision: 18, scale: 6
    t.integer "tracked_links", default: 0
    t.integer "tracked_images", default: 0
    t.boolean "parsed", default: false
    t.integer "endpoint_id"
    t.string "endpoint_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bounce_for_id"], name: "index_mailbox_messages_on_bounce_for_id"
    t.index ["held"], name: "index_mailbox_messages_on_held"
    t.index ["mail_from"], name: "index_mailbox_messages_on_mail_from"
    t.index ["message_id"], name: "index_mailbox_messages_on_message_id"
    t.index ["raw_table"], name: "index_mailbox_messages_on_raw_table"
    t.index ["rcpt_to"], name: "index_mailbox_messages_on_rcpt_to"
    t.index ["scope", "spam", "status", "timestamp"], name: "index_mailbox_messages_on_scope_spam_status_and_timestamp"
    t.index ["scope", "spam", "tag", "timestamp"], name: "index_mailbox_messages_on_scope_spam_tag_and_timestamp"
    t.index ["scope", "spam", "timestamp"], name: "index_mailbox_messages_on_scope_spam_and_timestamp"
    t.index ["scope", "threat", "status", "timestamp"], name: "index_mailbox_messages_on_scope_threat_status_and_timestamp"
    t.index ["scope", "threat", "timestamp"], name: "index_mailbox_messages_on_scope_threat_and_timestamp"
    t.index ["status"], name: "index_mailbox_messages_on_status"
    t.index ["token"], name: "index_mailbox_messages_on_token"
  end

  create_table "mailbox_raw_message_sizes", force: :cascade do |t|
    t.string "table_name"
    t.bigint "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["table_name"], name: "index_mailbox_raw_message_sizes_on_table_name"
  end

  create_table "mailbox_spam_checks", force: :cascade do |t|
    t.integer "message_id"
    t.decimal "score", precision: 8, scale: 2
    t.string "code"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_mailbox_spam_checks_on_code"
    t.index ["message_id"], name: "index_mailbox_spam_checks_on_message_id"
  end

  create_table "mailbox_stats_daily", force: :cascade do |t|
    t.integer "time", null: false
    t.bigint "incoming"
    t.bigint "outgoing"
    t.bigint "spam"
    t.bigint "bounces"
    t.bigint "held"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["time"], name: "index_mailbox_stats_daily_on_time", unique: true
  end

  create_table "mailbox_stats_hourly", force: :cascade do |t|
    t.integer "time", null: false
    t.bigint "incoming"
    t.bigint "outgoing"
    t.bigint "spam"
    t.bigint "bounces"
    t.bigint "held"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["time"], name: "index_mailbox_stats_hourly_on_time", unique: true
  end

  create_table "mailbox_stats_monthly", force: :cascade do |t|
    t.integer "time", null: false
    t.bigint "incoming"
    t.bigint "outgoing"
    t.bigint "spam"
    t.bigint "bounces"
    t.bigint "held"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["time"], name: "index_mailbox_stats_monthly_on_time", unique: true
  end

  create_table "mailbox_stats_yearly", force: :cascade do |t|
    t.integer "time", null: false
    t.bigint "incoming"
    t.bigint "outgoing"
    t.bigint "spam"
    t.bigint "bounces"
    t.bigint "held"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["time"], name: "index_mailbox_stats_yearly_on_time", unique: true
  end

  create_table "mailbox_suppressions", force: :cascade do |t|
    t.string "suppression_type"
    t.string "address"
    t.string "reason"
    t.decimal "timestamp", precision: 18, scale: 6
    t.decimal "keep_until", precision: 18, scale: 6
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address"], name: "index_mailbox_suppressions_on_address"
    t.index ["keep_until"], name: "index_mailbox_suppressions_on_keep_until"
  end

  create_table "mailbox_webhook_requests", force: :cascade do |t|
    t.string "uuid"
    t.string "event"
    t.text "url"
    t.integer "attempt"
    t.decimal "timestamp", precision: 18, scale: 6
    t.integer "status_code"
    t.text "body"
    t.text "payload"
    t.boolean "will_retry", default: false
    t.integer "webhook_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event"], name: "index_mailbox_webhook_requests_on_event"
    t.index ["timestamp"], name: "index_mailbox_webhook_requests_on_timestamp"
    t.index ["uuid"], name: "index_mailbox_webhook_requests_on_uuid"
    t.index ["webhook_id"], name: "index_mailbox_webhook_requests_on_webhook_id"
  end

  create_table "organization_ip_pools", id: :serial, force: :cascade do |t|
    t.integer "organization_id"
    t.integer "ip_pool_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "organization_users", id: :serial, force: :cascade do |t|
    t.integer "organization_id"
    t.integer "user_id"
    t.datetime "created_at"
    t.boolean "admin", default: false
    t.boolean "all_servers", default: true
    t.string "user_type"
  end

  create_table "organizations", id: :serial, force: :cascade do |t|
    t.string "uuid"
    t.string "name"
    t.string "permalink"
    t.string "time_zone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "ip_pool_id"
    t.integer "owner_id"
    t.datetime "deleted_at"
    t.datetime "suspended_at"
    t.string "suspension_reason"
    t.index ["permalink"], name: "index_organizations_on_permalink"
    t.index ["uuid"], name: "index_organizations_on_uuid"
  end

  create_table "queued_messages", id: :serial, force: :cascade do |t|
    t.integer "server_id"
    t.integer "message_id"
    t.string "domain"
    t.string "locked_by"
    t.datetime "locked_at"
    t.datetime "retry_after", precision: nil
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "ip_address_id"
    t.integer "attempts", default: 0
    t.integer "route_id"
    t.boolean "manual", default: false
    t.string "batch_key"
    t.index ["domain"], name: "index_queued_messages_on_domain"
    t.index ["message_id"], name: "index_queued_messages_on_message_id"
    t.index ["server_id"], name: "index_queued_messages_on_server_id"
  end

  create_table "routes", id: :serial, force: :cascade do |t|
    t.string "uuid"
    t.integer "server_id"
    t.integer "domain_id"
    t.integer "endpoint_id"
    t.string "endpoint_type"
    t.string "name"
    t.string "spam_mode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "token"
    t.string "mode"
    t.index ["token"], name: "index_routes_on_token"
  end

  create_table "scheduled_tasks", force: :cascade do |t|
    t.string "name"
    t.datetime "next_run_after", precision: nil
    t.index ["name"], name: "index_scheduled_tasks_on_name", unique: true
  end

  create_table "servers", id: :serial, force: :cascade do |t|
    t.integer "organization_id"
    t.string "uuid"
    t.string "name"
    t.string "mode"
    t.integer "ip_pool_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "permalink"
    t.integer "send_limit"
    t.datetime "deleted_at"
    t.integer "message_retention_days"
    t.integer "raw_message_retention_days"
    t.integer "raw_message_retention_size"
    t.boolean "allow_sender", default: false
    t.string "token"
    t.datetime "send_limit_approaching_at"
    t.datetime "send_limit_approaching_notified_at"
    t.datetime "send_limit_exceeded_at"
    t.datetime "send_limit_exceeded_notified_at"
    t.decimal "spam_threshold", precision: 8, scale: 2
    t.decimal "spam_failure_threshold", precision: 8, scale: 2
    t.string "postmaster_address"
    t.datetime "suspended_at"
    t.decimal "outbound_spam_threshold", precision: 8, scale: 2
    t.text "domains_not_to_click_track"
    t.string "suspension_reason"
    t.boolean "log_smtp_data", default: false
    t.boolean "privacy_mode", default: false
    t.index ["organization_id"], name: "index_servers_on_organization_id"
    t.index ["permalink"], name: "index_servers_on_permalink"
    t.index ["token"], name: "index_servers_on_token"
    t.index ["uuid"], name: "index_servers_on_uuid"
  end

  create_table "smtp_endpoints", id: :serial, force: :cascade do |t|
    t.integer "server_id"
    t.string "uuid"
    t.string "name"
    t.string "hostname"
    t.string "ssl_mode"
    t.integer "port"
    t.text "error"
    t.datetime "disabled_until"
    t.datetime "last_used_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statistics", id: :serial, force: :cascade do |t|
    t.bigint "total_messages", default: 0
    t.bigint "total_outgoing", default: 0
    t.bigint "total_incoming", default: 0
  end

  create_table "track_certificates", id: :serial, force: :cascade do |t|
    t.string "domain"
    t.text "certificate"
    t.text "intermediaries"
    t.text "key"
    t.datetime "expires_at", precision: nil
    t.datetime "renew_after", precision: nil
    t.string "verification_path"
    t.string "verification_string"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["domain"], name: "index_track_certificates_on_domain"
  end

  create_table "track_domains", id: :serial, force: :cascade do |t|
    t.string "uuid"
    t.integer "server_id"
    t.integer "domain_id"
    t.string "name"
    t.datetime "dns_checked_at", precision: nil
    t.string "dns_status"
    t.string "dns_error"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "ssl_enabled", default: true
    t.boolean "track_clicks", default: true
    t.boolean "track_loads", default: true
    t.text "excluded_click_domains"
  end

  create_table "user_invites", id: :serial, force: :cascade do |t|
    t.string "uuid"
    t.string "email_address"
    t.datetime "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["uuid"], name: "index_user_invites_on_uuid"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "uuid"
    t.string "first_name"
    t.string "last_name"
    t.string "email_address"
    t.string "password_digest"
    t.string "time_zone"
    t.string "email_verification_token"
    t.datetime "email_verified_at", precision: nil
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "password_reset_token"
    t.datetime "password_reset_token_valid_until", precision: nil
    t.boolean "admin", default: false
    t.string "oidc_uid"
    t.string "oidc_issuer"
    t.index ["email_address"], name: "index_users_on_email_address"
    t.index ["uuid"], name: "index_users_on_uuid"
  end

  create_table "webhook_events", id: :serial, force: :cascade do |t|
    t.integer "webhook_id"
    t.string "event"
    t.datetime "created_at"
    t.index ["webhook_id"], name: "index_webhook_events_on_webhook_id"
  end

  create_table "webhook_requests", id: :serial, force: :cascade do |t|
    t.integer "server_id"
    t.integer "webhook_id"
    t.string "url"
    t.string "event"
    t.string "uuid"
    t.text "payload"
    t.integer "attempts", default: 0
    t.datetime "retry_after"
    t.text "error"
    t.datetime "created_at"
    t.string "locked_by"
    t.datetime "locked_at", precision: nil
    t.index ["locked_by"], name: "index_webhook_requests_on_locked_by"
  end

  create_table "webhooks", id: :serial, force: :cascade do |t|
    t.integer "server_id"
    t.string "uuid"
    t.string "name"
    t.string "url"
    t.datetime "last_used_at", precision: nil
    t.boolean "all_events", default: false
    t.boolean "enabled", default: true
    t.boolean "sign", default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["server_id"], name: "index_webhooks_on_server_id"
  end

  create_table "worker_roles", force: :cascade do |t|
    t.string "role"
    t.string "worker"
    t.datetime "acquired_at", precision: nil
    t.index ["role"], name: "index_worker_roles_on_role", unique: true
  end

end
