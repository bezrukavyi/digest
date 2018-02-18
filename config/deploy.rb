# config valid for current version and patch releases of Capistrano
lock "~> 3.10.1"

set :application, 'digestify'
set :repo_url, 'git@github.com:digestify/digestify.git'

set :use_sudo, false
set :deploy_via, :copy
set :keep_releases, 2

set :log_level, :debug
set :pty, true

set :rvm1_ruby_version, 'ruby-2.4.3'
set :rvm1_map_bins, %w[rake gem bundle ruby rails]

set :rvm_type, :user
set :default_env, rvm_bin_path: '~/.rvm/bin'

set :linked_files, %w[.env config/database.yml]
set :linked_dirs, %w[log tmp/pids tmp/cache tmp/sockets vendor/bundle public/uploads]

namespace :deploy do
  desc 'Uploads required config files'
  task :upload_configs do
    on roles(:all) do
      upload!(".env.#{fetch(:stage)}", "#{deploy_to}/shared/.env")
      upload!('config/database.yml', "#{deploy_to}/shared/config/database.yml")
    end
  end

  after :finished, 'app:restart'
end

namespace :app do
  desc 'Start application'
  task :start do
    on roles(:app) do
      invoke 'rvm1:hook'
      within "#{fetch(:deploy_to)}/current/" do
        execute :bundle, :exec, :"puma -C config/puma.rb -e #{fetch(:stage)}"
      end
    end
  end

  desc 'Stop application'
  task :stop do
    on roles(:app) do
      invoke 'rvm1:hook'
      within "#{fetch(:deploy_to)}/current/" do
        execute :bundle, :exec, :'pumactl -F config/puma.rb stop'
      end
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app) do
      invoke 'rvm1:hook'
      within "#{fetch(:deploy_to)}/current/" do
        if test("[ -f #{deploy_to}/current/tmp/pids/puma.pid ]")
          execute :bundle, :exec, :'pumactl -F config/puma.rb stop'
        end

        execute :bundle, :exec, :"puma -C config/puma.rb -e #{fetch(:stage)}"
      end
    end
  end
end
