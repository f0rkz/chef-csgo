#
# Cookbook:: chef-csgo
# Attributes:: default
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
default['steam']['user'] = 'steam'
default['steam']['steamcmd']['install_dir'] = '/opt/steam'

default['csgo']['appid'] = '740'
default['csgo']['install_dir'] = '/opt/csgo'

default['csgo']['gameserver']['mapgroup'] = false

default['csgo']['gameserver']['startmap'] = 'de_dust2'

=begin
game_type and game_mode settings
Default: Classic Casual
Mode                game_type 	game_mode
Classic Casual	    0           0
Classic Competitive	0	          1
Arms Race 	        1	          0
Demolition 	        1           1
Deathmatch	        1           2
=end
default['csgo']['gameserver']['game_type'] = 0
default['csgo']['gameserver']['game_mode'] = 0

# sv_setsteamaccount
default['csgo']['gameserver']['steamaccount'] = ''

# server.cfg options
default['csgo']['gameserver']['configuration'] = {
  hostname: "Chef CSGO Server",
  rcon_password: "changeme",
  sv_password: "",
  log: 'on',
  sv_logbans: 1,
  sv_logecho: 1,
  sv_logfile: 1,
  sv_log_onefile: 0,
  sv_hibernate_when_empty: 1,
  sv_hibernate_ms: 5,
  host_name_store: 1,
  host_info_show: 1,
  host_players_show: 2,
  mp_autoteambalance: 1,
  mp_limitteams: 2,
  mp_afterroundmoney: 0,
  mp_playercashawards: 1,
  mp_teamcashawards: 1,
  mp_maxrounds: 30,
  mp_timelimit: 0,
  mp_roundtime: 5,
  mp_freezetime: 6,
  mp_buytime: 90,
  mp_forcecamera: 1,
  mp_defuser_allocation: 0,
  mp_death_drop_gun: 1,
  mp_death_drop_grenade: 2,
  mp_death_drop_defuser: 1
}

# exec these config files
default['csgo']['gameserver']['exec'] = [
  "banned_user.cfg",
  "banned_ip.cfg"
]
