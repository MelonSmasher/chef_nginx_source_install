#
# Cookbook Name:: nginx_source_install
# Recipe:: mainline
#
# MIT License
#

# Update apt cache
def apt_get_update()
  execute 'apt_get_update' do
    command 'apt-get update'
  end
end

# Update yum cache
def yum_makecache()
  execute 'yum_makecache' do
    command 'yum makecache'
  end
end

# Install stable Nginx
def install_nginx(options_list)
  if options_list.is_a?
    options_list = options_list.join(' ')
  end
  options_list.strip!
  if options_list.empty?
    execute 'install_nginx' do
      command 'curl -sL https://raw.githubusercontent.com/MelonSmasher/NginxInstaller/master/nginx-install.sh | bash -s -- -a'
      only_if
    end
  else
    execute 'install_nginx' do
      command "curl -sL https://raw.githubusercontent.com/MelonSmasher/NginxInstaller/master/nginx-install.sh | bash -s -- -a #{options_list}"
    end
  end
end

# Install bleeding edge Nginx
def install_nginx_mainline(options_list)
  if options_list.is_a?
    options_list = options_list.join(' ')
  end
  options_list.strip!
  options_list = '-x ' + options_list
  install_nginx(options_list)
end

platform = node['platform_family']
case platform
  when 'debian', 'ubuntu'
    apt_get_update
    package 'curl'
    install_nginx_mainline ''
  when 'rhel', 'centos'
    yum_makecache
    package 'curl'
    install_nginx_mainline ''
  else
    puts "#{platform} is not supported by this installer."
end