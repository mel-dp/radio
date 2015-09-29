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