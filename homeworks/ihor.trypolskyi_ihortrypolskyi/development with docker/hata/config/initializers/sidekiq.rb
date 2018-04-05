current_redis = { host: :redis, port: 6379 }

Sidekiq.configure_server do |config|
  config.redis = current_redis
end

Sidekiq.configure_client do |config|
  config.redis = current_redis
end
