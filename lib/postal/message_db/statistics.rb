# frozen_string_literal: true

module Postal
  module MessageDB
    class Statistics

      def initialize(database)
        @database = database
      end

      STATS_GAPS = { hourly: :hour, daily: :day, monthly: :month, yearly: :year }.freeze
      COUNTERS = [:incoming, :outgoing, :spam, :bounces, :held].freeze

      #
      # Increment an appropriate counter
      #
      def increment_one(type, field, time = Time.now)
        time = time.utc
        initial_values = COUNTERS.map do |c|
          field.to_sym == c ? 1 : 0
        end

        time_i = time.send("beginning_of_#{STATS_GAPS[type]}").utc.to_i

        get_klass(type).import(
          COUNTERS,
          [time_i].concat(initial_values),
          validate: false,
          on_duplicate_key_update: { conflict_target: [:time], set: { field => field + 1 } }
        )
      end

      #
      # Increment all stats counters
      #
      def increment_all(time, field)
        STATS_GAPS.each_key do |type|
          increment_one(type, field, time)
        end
      end

      #
      # Get a statistic (or statistics)
      #
      def get(type, counters, start_date = Time.now, quantity = 10)
        start_date = start_date.utc
        items = quantity.times.each_with_object({}) do |i, hash|
          hash[(start_date - i.send(STATS_GAPS[type])).send("beginning_of_#{STATS_GAPS[type]}").utc] = counters.each_with_object({}) do |c, h|
            h[c] = 0
          end
        end

        get_klass(type).where(time: items.keys.map(&:to_i)).each do |data|
          time = Time.zone.at(data.time)
          data.each do |key, value|
            items[time][key.to_sym] = value
          end
        end
        items.to_a.reverse
      end

      def get_klass(type)
        {
          hourly: Mailbox::Stats::Hourly,
          daily: Mailbox::Stats::Daily,
          monthly: Mailbox::Stats::Monthly,
          yearly: Mailbox::Stats::Yearly
        }[type]
      end

    end
  end
end
