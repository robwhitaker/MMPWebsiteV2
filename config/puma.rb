threads 1,16
workers 4

if ENV["RACK_ENV"] == 'production'
  bind 'unix://var/run/puma.sock'
  pidfile 'var/run/puma.pid'
else
  app_dir = File.expand_path("../../", __FILE__)
  shared_dir = "#{app_dir}/shared"

  bind "unix://#{shared_dir}/sockets/puma.sock"
  stdout_redirect "#{shared_dir}/log/puma.stdout.log", "#{shared_dir}/log/puma.stderr.log", true

  pidfile "#{shared_dir}/pids/puma.pid"
  state_path "#{shared_dir}/pids/puma.state"
  activate_control_app

  on_worker_boot do
    ActiveSupport.on_load(:active_record) do
      ActiveRecord::Base.establish_connection
    end
  end
end
