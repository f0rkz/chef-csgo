describe user('steam') do
  its('home') { should eq '/opt/steam' }
  its('shell') { should eq '/bin/bash' }
end

describe file('/opt/steam/steamcmd.sh') do
  it { should exist }
  it { should be_file }
  it { should be_owned_by 'steam' }
  its('group') { should eq 'steam' }
end

describe service('csgo') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe command('ps -ef | grep srcds_linux') do
  its('exit_status') { should eq 0 }
end
