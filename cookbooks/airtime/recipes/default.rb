template '/etc/apt/sources.list.d/airtime.list' do
  source 'etc_apt_sources.list.d_airtime.list.erb'
  mode 00644
end

execute 'sudo apt-get update'
package 'sourcefabric-keyring' do
	options '-y --force-yes'
end
execute 'sudo apt-get update'

package 'postgresql'

package 'icecast2'

package 'pulseaudio' do
	action :purge
end

package 'airtime'

execute 'sudo locale-gen en_GB.UTF-8'
execute 'sudo cp /usr/share/zoneinfo/Europe/London /etc/localtime'

template '/etc/default/icecast2' do
  source 'etc_default_icecast2.erb'
  mode 00644
end

service 'icecast2' do
  action [:enable, :start]
end