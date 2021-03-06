#!/usr/bin/env ruby

require "rocket_sms"

redis_url = ENV['REDIS_URL'] || ARGV[0]
log_location = ENV['LOG_LOCATION'] || ARGV[1] || STDOUT
log_location.sync = true if log_location.respond_to? :sync=
log_level = ENV['LOG_LEVEL'].to_i || Logger::INFO

scheduler = RocketSMS::Scheduler.instance
scheduler.redis_url = redis_url
scheduler.log_location = log_location
scheduler.log_level = log_level
scheduler.start
