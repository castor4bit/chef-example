#
# Cookbook Name:: vhosts
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

node['apache']['vhosts'].each_pair do |site_id, site_config|
  template File.join(node['apache']['dir'], 'sites-available', "#{site_id}.conf") do
    source 'vhost.conf.erb'
    owner 'root'
    group 'root'
    mode '0644'

    common_config = node['apache']['vhosts']['common'] || {}
    config = common_config.merge(site_config) do |key, old, new|
      if old.is_a?(Array) and new.is_a?(Array)
        old.concat new
      else
        new
      end
    end

    variables({
      :serveradmin => config['serveradmin'] || "webmaster@#{config['servername']}",
      :servername => config['servername'],
      :server_aliases => config['serveraliases'] || [],
      :documentroot => config['documentroot'],
      :options => config['default-options'] || ['FollowSymLinks', 'MultiViews', 'ExecCgi'],
      :aliases => config['aliases'] || {},
      :extra_config => config['extra-config'] || []
    })

    notifies :reload, 'service[apache2]', :delayed
  end

  # enable virtual host

  apache_site site_id do
    notifies :reload, 'service[apache2]', :delayed
  end
end
