module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Hash 2391
# Hash 3574
# Hash 7260
# Hash 5521
# Hash 9024
# Hash 6301
# Hash 7265
# Hash 5598
# Hash 6942
# Hash 7878
# Hash 9865
# Hash 8324
# Hash 7450
# Hash 8445
# Hash 2307
# Hash 1037