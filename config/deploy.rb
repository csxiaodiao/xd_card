# frozen_string_literal: true

# config valid for current version and patch releases of Capistrano
lock("~> 3.14.1")

set(:application, "xd_hospital")
set(:repo_url, "git@github.com:csxiaodiao/xd_hospital.git")

set(:rails_env, fetch(:stage))
set(:deploy_to, "/apps/#{fetch(:application)}_#{fetch(:rails_env)}")
append(
  :linked_files,
  "config/database.yml",
  "config/master.key",
  "config/sidekiq.yml",
  "config/storage.yml",
  "config/webpacker.yml",
  ".ruby-gemset",
  ".ruby-version"
)
append(
  :linked_dirs,
  ".bundle",
  "log",
  "tmp/pids",
  "tmp/cache",
  "tmp/sockets",
  "public/packs",
  "public/images",
  "public/css",
  "public/js",
  "public/semantic",
  "storage",
  "node_modules"
)
set(:rvm_ruby_version, "ruby-2.6.5@xd_hospital")
set(:puma_rackup, -> { File.join(current_path, "config.ru") })
set(:puma_state, "#{shared_path}/tmp/pids/puma.state")
set(:puma_pid, "#{shared_path}/tmp/pids/puma.pid")
set(:puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock") # accept array for multi-bind
set(:puma_conf, "#{shared_path}/puma.rb")
set(:puma_access_log, "#{shared_path}/log/puma_access.log")
set(:puma_error_log, "#{shared_path}/log/puma_error.log")
set(:puma_role, :app)
set(:puma_env, fetch(:stage).to_s)
set(:puma_threads, [4, 16])
set(:puma_workers, -> { fetch(:stage) == "production" ? 3 : 0 })
set(:puma_restart_command, "bundle exec --keep-file-descriptors puma")
set(:puma_worker_timeout, nil)
set(:puma_init_active_record, false)
set(:puma_preload_app, true)

# set :sidekiq_pid, -> { "#{shared_path}/tmp/pids/sidekiq.pid" }
# set :sidekiq_log, -> { "#{shared_path}/log/sidekiq.log" }

set(:init_system, :systemd)
set(:service_unit_name, "sidekiq.service")

namespace :puma do
  desc "Create Directories for Puma Pids and Socket"
  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end

  before :start, :make_dirs
end

namespace :deploy do
  desc "Make sure local git is in sync with remote."
  task :check_revision do
    on roles(:app) do
      unless %x(git rev-parse HEAD) == %x(git rev-parse origin/master)
        puts "WARNING: HEAD is not the same as origin/master"
        puts "Run `git push` to sync changes."
        exit
      end
    end
  end

  desc "Initial Deploy"
  task :initial do
    on roles(:app) do
      before "deploy:restart", "puma:start"
      invoke "deploy"
    end
  end

  desc "Restart application"
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke "puma:restart"
    end
  end

  # before :starting,     :check_revision
  # after  :finishing,    :compile_assets
  # after  :finishing,    :cleanup
end
