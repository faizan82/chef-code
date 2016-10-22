# Configurations for default 
#
#
case node['platform_family']
when 'amazon','rhel'
     default['main']['dir'] = '/etc/nginx'
     default['config']['file'] = '/etc/nginx/nginx.conf'
     default['domain']['name'] = '/etc/nginx/sites-available/qaapp.pearson.com'
     default['msg']['echo']    = 'RHEL_Family'
     default['nginx']['group'] = 'nginx'
     default['nginx']['user']  = 'nginx'
     default['nginx']['access_log_options']     = nil
     default['nginx']['error_log_options']      = nil
     default['nginx']['disable_access_log']     = false
     default['nginx']['log_formats']            = {}
     default['nginx']['install_method']         = 'package'
     default['nginx']['default_site_enabled']   = true
     default['nginx']['worker_process']         = 'auto'
     default['nginx']['error_log']              = '/var/log/nginx/nginx_error.log'	
     default['nginx']['pid_file']               = '/var/run/nginx.pid'
     default['nginx']['module_conf']            = '/usr/share/nginx/modules'
     default['nginx']['root']                   = '/usr/share/ngix/html'
     default['nginx']['worker']                 = '1024'
     default['nginx']['site_dir']               = '/etc/nginx/sites-available'
when 'debian'
     default['msg']['echo'] = 'DEBIAN_Family'
else default['msg']['echo'] = 'UNKNOWN'
end
