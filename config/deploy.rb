# frozen_string_literal: true

# config valid for current version and patch releases of Capistrano
lock '~> 3.11.1'

set :application, 'house-api'
set :repo_url, 'git@bitbucket.org:boris_korkmazov/house-api.git'
set :deploy_to, '/home/deploy/projects/house-api'
append :linked_files, 'config/database.yml', 'config/master.key'
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system', 'public/uploads', 'public/sitemaps'
set :local_user, -> { `git config user.name`.chomp }
set :keep_releases, 5
set :rvm_type, :user
set :rvm_ruby_version, '2.6.0'
set :puma_workers, 1
set :puma_threads, [0, 16]
set :whenever_identifier, -> { "#{fetch(:application)}_#{fetch(:stage)}" }

namespace :prometheus do
  task :start do
    on roles(:app) do
      within current_path do
        execute :bundle, :exec, 'prometheus_exporter &'
      end
    end
  end
end

after 'deploy:finished', 'prometheus:start'
