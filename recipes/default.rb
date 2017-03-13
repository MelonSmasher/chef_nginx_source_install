#
# Cookbook Name:: nginx_source_install
# Recipe:: default
#
# MIT License
#

# Install NGINX
def install_nginx(cmd)
  execute 'install_nginx' do
    command "#{cmd}"
  end
end


platform = node['platform']
# Make sure our platform is supported
case platform
  when 'debian', 'ubuntu', 'redhat', 'centos'

    # Init the command array
    cmd = ['curl -sL https://raw.githubusercontent.com/MelonSmasher/NginxInstaller/master/nginx-install.sh | bash -s --']
    # What features do we want to compile in?
    features = node['nginx']['features']

    # Compile with ALPN support for http2?
    if features['alpn']
      cmd.push('-a')
    end

    # Enable the mail module?
    if features['mail']
      cmd.push('-m')
    end

    # Enable the vts module?
    if features['vts']
      cmd.push('-v')
    end

    # Enable the geoip module?
    if features['geoip']
      cmd.push('-g')
    end

    # Enable the pagespeed module?
    if features['pagespeed']
      cmd.push('-p')
    end

    # Enable the cache purge module?
    if features['cache_purge']
      cmd.push('-c')
    end

    # Enable the ldap auth module?
    if features['ldap_auth']
      cmd.push('-l')
    end

    # Should we install the mainline version instead of the stable version?
    if node['nginx']['mainline']
      cmd.push('-x')
    end

    # Are we forcing the install even if the version is the same?
    if node['nginx']['force']
      cmd.push('-f')
    end

    # If we are ignoring failures surround install command in a try catch
    if node['nginx']['ignore_failure']
      # Run in a try catch
      begin
        install_nginx cmd.join(' ')
      rescue
        log 'NGINX Installer: Script failure.' do
          message "The installation script has failed, moving on..."
          level :warn
        end
      end
    else
      # Run without failure protection
      install_nginx cmd.join(' ')
    end

  else
    log 'NGINX Installer: Unsupported platform.' do
      message "#{platform} is not supported by this installer."
      level :warn
    end
end