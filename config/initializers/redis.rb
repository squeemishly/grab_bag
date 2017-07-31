config = { host: ENV['REDIS_HOST'], port: ENV['REDIS_PORT'] }
Redis.current = Redis.new(config)
