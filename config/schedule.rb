# frozen_string_literal: true

set :output, '/home/deployer/cron.log'

every 1.day, at: '5:00 am' do
  rake '-s sitemap:refresh:no_ping'
end
