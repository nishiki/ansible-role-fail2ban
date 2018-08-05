require 'serverspec'

set :backend, :exec

describe package('fail2ban') do
  it { should be_installed }
end

describe file('/etc/fail2ban/jail.conf') do
  it { should exist }
  it { should be_file }
  it { should be_mode 644 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should contain 'bantime = 600' }
end

describe file('/etc/fail2ban/jail.d/jails.conf') do
  it { should exist }
  it { should be_file }
  it { should be_mode 644 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should contain '[ssh]' }
  it { should contain '[nextcloud]' }
  it { should contain 'port = 80,443' }
  it { should contain 'maxretry = 2' }
end

describe file('/etc/fail2ban/filter.d/nextcloud.conf') do
  it { should exist }
  it { should be_file }
  it { should be_mode 644 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should contain "failregex = Login failed.*Remote IP.*'<HOST>'" }
end

describe service('fail2ban') do
  it { should be_enabled }
  it { should be_running.under('systemd') }
end
