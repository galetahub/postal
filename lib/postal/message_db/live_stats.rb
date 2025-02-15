# frozen_string_literal: true

module Postal
  module MessageDB
    class LiveStats

      def initialize(database)
        @database = database
      end

      #
      # Increment the live stats by one for the current minute
      #
      def increment(type)
        time = Time.now.utc

        Mailbox::LiveStat.import(
          [:counter_type, :minute, :timestamp, :count],
          [[type.to_s, time.min, time.to_f, 1]],
          validate: false,
          on_duplicate_key_update: {
            conflict_target: [:counter_type, :minute],
            set: { count: :count + 1, timestamp: time.to_f }
          }
        )
      end

      #
      # Return the total number of messages for the last 60 minutes
      #
      def total(minutes, options = {})
        if minutes > 60
          raise Postal::Error, "Live stats can only return data for the last 60 minutes."
        end

        options[:types] ||= [:incoming, :outgoing]
        raise Postal::Error, "You must provide at least one type to return" if options[:types].empty?

        time = minutes.minutes.ago.beginning_of_minute.utc.to_f
        Mailbox::LiveStat.where(counter_type: options[:types], timestamp: time..).sum(:count)
      end

    end
  end
end
