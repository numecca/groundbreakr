# Amount of unicorn workers to spin up
worker_processes 3

# How long to wait before killing an unresponsive worker
timeout 30

# Load the app before spawning workers - this makes newrelic work properly
preload_app true

@dj_pid = nil
@clock_pid = nil

before_fork do |server, worker|
  # Replace with MongoDB or whatever
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.connection.disconnect!
    Rails.logger.info('Disconnected from ActiveRecord')
  end

  # If you are using Redis but not Resque, change this
  if defined?(Resque)
    Resque.redis.quit
    Rails.logger.info('Disconnected from Redis')
  end

  # Spawn a Delayed_Job worker process
  @dj_pid ||= spawn("bundle exec rake jobs:work")

  # Spawn a Clockwork clock process
  @clock_pid ||= spawn("bundle exec clockwork app/clock.rb")

  sleep 1
end

after_fork do |server, worker|
  # Replace with MongoDB or whatever
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.establish_connection
    Rails.logger.info('Connected to ActiveRecord')
  end

  # If you are using Redis but not Resque, change this
  if defined?(Resque)
    Resque.redis = ENV['REDIS_URI']
    Rails.logger.info('Connected to Redis')
  end
end