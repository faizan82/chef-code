#
# Cookbook Name:: learn_nginx
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'selinux::permissive'
#include_recipe 'nginx_webserver::config_dev'
#include_recipe 'nginx_webserver::config_qa'

package 'nginx' 


service 'nginx' do 
    action [:enable, :start]
end

group node[:nginx][:group]

user node[:nginx][:user] do 
    group node[:nginx][:group]
    system true
    shell '/bin/bash'
end

directory node[:nginx][:site_dir] do
     action :create
     recursive true
end

template '/etc/nginx/nginx.conf' do
    source 'nginx.conf.erb'
    mode '0644'
    group 'nginx'
    user 'nginx'
end

template '/usr/share/nginx/html/index.html' do 
     source 'index.html.erb'
     mode '0644'
     owner 'nginx'
     group 'nginx'
end


=begin
file '/usr/share/nginx/html/index.html' do
     content '<html><bod><p>Testing nginx</p></body></html>'
end

%w[ /var/www /var/www/html ].each do |path|
    directory path do
       action :delete
    end
end

=end
