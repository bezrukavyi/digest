role :app, %w(deployer@138.68.136.195)
role :web, %w(deployer@138.68.136.195)
role :db,  %w(deployer@138.68.136.195)

set :branch, 'production'
set :deploy_to, '/home/deployer/www/digestify'
