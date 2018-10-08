# frozen_string_literal: true
haproxy_install 'source' do
  source_url node['haproxy']['source_url']
  source_checksum node['haproxy']['source_checksum']
  source_version node['haproxy']['source_version']
  use_libcrypt '1'
  use_pcre '1'
  use_openssl '1'
  use_zlib '1'
  use_linux_tproxy '1'
  use_linux_splice '1'
end

haproxy_config_global ''

haproxy_config_defaults ''

haproxy_service 'haproxy' do
  source_version node['haproxy']['source_version']
  systemd_wrapper true if node['haproxy']['source_version'].to_f < 1.8
  action :create
end
