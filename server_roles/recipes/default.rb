#
# Cookbook Name:: server_roles
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

Chef::Log.info("f-world21:opsworks-cookbooks/server_roles is going!")
Chef::Log.info("inspect node[:deploy] object")
Chef::Log.info(node[:deploy])

node[:deploy].each do |application, deploy_value|
  Chef::Log.info("create #{deploy_value[:deploy_to]}/shared/config dir if not exist")
  directory "#{deploy_value[:deploy_to]}/shared/config" do
    group deploy_value[:group]
    owner deploy_value[:user]
    mode 0774
    recursive true
    action :create
  end

  template "#{deploy_value[:deploy_to]}/shared/config/server_roles.yml" do
    source "server_roles.yml.erb"
    cookbook 'server_roles'
    mode "0660"
    group deploy_value[:group]
    owner deploy_value[:user]
    variables(:server_roles => deploy_value[:server_roles], :environment => deploy_value[:rails_env])

    #notifies :run, "execute[restart Rails app #{application}]"

    only_if do
      deploy_value[:database][:host].present? && File.directory?("#{deploy_value[:deploy_to]}/shared/config/")
    end
  end
end
