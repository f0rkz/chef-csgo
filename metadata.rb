name 'chef-csgo'
maintainer 'The Authors'
maintainer_email 'you@example.com'
license 'All Rights Reserved'
description 'Installs and Configures a CSGO Dedicated Server'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.0'
chef_version '>= 12.1' if respond_to?(:chef_version)
issues_url 'https://github.com/f0rkz/chef-csgo/issues'
source_url 'https://github.com/f0rkz/chef-csgo'
depends 'chef-steamcmd'

%w(ubuntu debian).each do |os|
  supports os
end
