# main details
set :application, "3dtzk"
role :web, "tzk3d.com"                          # Your HTTP server, Apache/etc
role :app, "tzk3d.com"                          # This may be the same as your `Web` server
role :db,  "tzk3d.com", :primary => true # This is where Rails migrations will run
#role :db,  "3dtzk.com"

#server details
default_run_options[:pty] = true  # Must be set for the password prompt
set :deploy_to, "/home/dreamlinx/ROR/tzk3d.com"
set :user, "dreamlinx"
set :user_sudo, true
set :ssh_options, { :forward_agent => true }
#repo details
set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :scm_username, "dreamlx"
set :scm_passphrase, "github2melx"
set :repository,  "git@github.com:dreamlx/tzk3d.git"
set :branch, "master"
set :deploy_via, :remote_cache


#tasks
namespace :deploy do
  task :restart, :roles => :app do
    run "touch #{current_path/tmp/restart.txt}"
  end
  
  task :stop, :roles => :app do
    #do nonthing
  end
  
  desc "Symlink shared resources on each release - not used"
  task :symlink_shared, :roles => :app do
    #run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  
  task :change_db , :roles => :app do
    run "mv #{release_path}/config/database.yml #{release_path}/config/database.yml.orig"
    run "mv #{release_path}/config/database.yml.server #{release_path}/config/database.yml"
  end
end

after 'deploy:update_code', 'deploy:symlink_shared'
after 'deploy:update_code', 'deploy:change_db'
# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end