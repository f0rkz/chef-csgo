#
# Cookbook:: chef-csgo
# Recipe:: default
#
# Author:: Nick Gray (f0rkz@f0rkznet.net)
#
# Copyright:: 2017 f0rkznet.net
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

package 'lib32gcc1'
package 'git'
package 'wget'

execute 'reload systemd' do
  command 'systemctl daemon-reload'
  action :nothing
end

csgo_base_dir = node['csgo']['install_dir']

user node['steam']['user'] do
  system true
  home node['steam']['steamcmd']['install_dir']
  shell '/bin/bash'
  action :create
end

# Do other things for a single server instance instead
# Create the gameserver install directory
directory csgo_base_dir do
  owner node['steam']['user']
  group node['steam']['user']
  mode '0755'
  recursive true
  action :create
  notifies :install, 'steamcmd_app[install csgo]', :immediately
end

steamcmd_app 'install csgo' do
  base_game_dir csgo_base_dir
  user node['steam']['user']
  group node['steam']['user']
  appid node['csgo']['appid']
  action :nothing
end

template 'server cfg' do
  path "#{csgo_base_dir}/#{node['csgo']['appid']}/csgo/cfg/server.cfg"
  source 'csgo/server.cfg.erb'
  owner node['steam']['user']
  group node['steam']['user']
  mode '0744'
end

template '/etc/systemd/system/csgo.service' do
  source 'csgo.service.erb'
  owner 'root'
  group 'root'
  mode '0744'
  notifies :enable, 'service[csgo]', :immediately
  notifies :run, 'execute[reload systemd]', :delayed
  notifies :start, 'service[csgo]', :delayed
end

service 'csgo' do
  supports status: true
  action :nothing
end
