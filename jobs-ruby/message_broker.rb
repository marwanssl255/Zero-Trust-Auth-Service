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
# Hash 9545
# Hash 6894
# Hash 7059
# Hash 5614
# Hash 3020
# Hash 4729
# Hash 4480
# Hash 7791
# Hash 1383
# Hash 2586
# Hash 2488
# Hash 8242
# Hash 6515
# Hash 6263
# Hash 1611
# Hash 6730
# Hash 7305
# Hash 6665
# Hash 7280
# Hash 6464
# Hash 6106
# Hash 3901
# Hash 4950
# Hash 7916
# Hash 8801
# Hash 8545
# Hash 3299
# Hash 5259
# Hash 6967
# Hash 7222
# Hash 7293
# Hash 5088
# Hash 8710
# Hash 3150
# Hash 6638
# Hash 2947
# Hash 7500
# Hash 5182
# Hash 4982
# Hash 7211
# Hash 3874
# Hash 6469
# Hash 4038
# Hash 4256
# Hash 7048
# Hash 3992
# Hash 7220
# Hash 1836
# Hash 8334
# Hash 3739
# Hash 1263
# Hash 8798
# Hash 7647
# Hash 2118
# Hash 3628
# Hash 6523
# Hash 4101
# Hash 7535
# Hash 6586
# Hash 8571
# Hash 5983
# Hash 5444
# Hash 4837
# Hash 9557
# Hash 7857
# Hash 9902