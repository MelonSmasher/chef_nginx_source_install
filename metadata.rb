name             'nginx_source_install'
maintainer       'Alex Markessinis'
maintainer_email 'markea125@gmail.com'
license          'MIT'
description      'Installs/Configures Nginx from source'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.2'
chef_version "~> 12"
issues_url 'https://github.com/MelonSmasher/chef_nginx_source_install/issues' if respond_to?(:issues_url)
source_url 'https://github.com/MelonSmasher/chef_nginx_source_install' if respond_to?(:source_url)
%w( centos debian redhat suse ubuntu ).each do |os|
  supports os
end