begin
  return if Rails.env.test?
rescue
  nil
end

if ENV['RAILS_ENV'] == 'development'
  port 3000
else
  app_path = '/home/deployer/www/digestify'

  directory "#{app_path}/current"

  rackup "#{app_path}/current/config.ru"

  daemonize true

  pidfile "#{app_path}/shared/tmp/pids/puma.pid"

  state_path "#{app_path}/shared/tmp/puma.state"

  workers 1

  threads 0, 4

  bind "unix:#{app_path}/shared/tmp/sockets/puma.sock"

  preload_app!
end
