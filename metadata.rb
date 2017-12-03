name 'chef-csgo'
maintainer 'Nick Gray'
maintainer_email 'f0rkz@f0rkznet.net'
license 'Apache-2.0'
description 'Installs/configures CSGO dedicated server'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.2.0'
chef_version '>= 12.1' if respond_to?(:chef_version)
issues_url 'https://github.com/f0rkz/chef-csgo/issues'
source_url 'https://github.com/f0rkz/chef-csgo'
depends 'chef-steamcmd'
depends 'chef-sourcemod'

%w(ubuntu debian).each do |os|
  supports os
end
